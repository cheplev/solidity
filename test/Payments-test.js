const { expect } = require("chai");
const { ethers } = require("hardhat");
const { int } = require("hardhat/internal/core/params/argumentTypes");

describe("Payments", function() {
    let acc1
    let acc2
    let payments

    beforeEach(async function() {
        [acc1, acc2] = await ethers.getSigners();
        const Payments = await ethers.getContractFactory("Payments")
        payments = await Payments.deploy()
        await payments.deployed();
    })

    it("should be deployed", async function() {
        expect(payments.address).to.be.properAddress
    })

    it("should have 0 ether by default", async function() {
        const balance = await payments.currentBalance()
        expect(balance).to.eq(0);
    }) 

    it("should be possible to send funds", async () => {
        const value = 300;
        const msg = 'Hello'
        const balanceBefore = await payments.currentBalance();

        const tx = await payments.connect(acc2).pay(msg, { value: value })
        await expect(() => tx)
            .to.changeEtherBalance(acc2, -value)
        const balanceAfter = await payments.currentBalance();

        await tx.wait();
        
        expect(balanceAfter).to.eq(balanceBefore + value)

        const newPayment = await payments.getPayment(acc2.address, 0 )

        expect(newPayment.message).to.eq(msg)
        expect(newPayment.amount).to.eq(value)
        expect(newPayment.from).to.eq(acc2.address)
    })


})
