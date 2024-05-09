import './Lock.json';
import { ethers } from 'ethers';

export const getLockContract = (address, provider) => {
    const abi = require('./Lock.json').abi;
    return new ethers.Contract(address, abi, provider);

}

export const createDoctor = async (lockContract, doctorAddress, doctorName) => {
    const tx = await lockContract.createDoctor(doctorAddress, doctorName);
    await tx.wait();
}

