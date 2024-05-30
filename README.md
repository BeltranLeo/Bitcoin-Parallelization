# Bitcoin Parallelization
Experiments to parallelize the execution of different Bitcoin components.

# Parallelization

By studying the different types of data structures and storage, better resource usage efficiency can be obtained to process all types of data involved in a blockchain.

Currently, modern processors, in their various architectures, allow the concurrent use of multiple cores, which can powerfully impact the performance of different applications.

For Bitcoin Cash, one such application is the parallel processing of the UTXO set. We will explore the different ways in which this can be achieved.


## Standardization of the UTXO set

A clear reference implementation, which contemplates the various applications of the UTXO set, can help to better plan the processing of the elements.

Currently, some of these applications include:

- **Validation of transactions** received by a node.
- **UTXO commitments**, which allow for the rapid launch of new nodes on the network.
- **Consultation of available UTXO** to prepare a new transaction.

In the future, several of these applications will be needed. We can also add these for future designs:

- **A simple scheme to find an UTXO in no more than O(log(n)) time.**
- **Offline validation of wallet transactions**, with minimal overhead (similar to the chain of hashes downloaded by SPV wallets), allowing to quickly find if a UTXO is currently valid.
- **Proof of existence of a UTXO** in a given time / block.

## Possible structures

Some of the potentially useful structures for this task include:

- **Merkle trees:** Similar to how today we validate the inclusion of a transaction in a block using SPV, we can think of a Merkle tree (potentially sorted using CTOR). 
- **AVL trees:** A self-balancing binary search tree allows one to find, add or remove items quickly. However, unordered inclusion, as expected from nodes that receive transactions in an unordered manner, has no guarantee of resulting in identical trees (in the sense that each node in the tree maintains its position).
- **Ordered trees:** Allow to include elements in such a way that each node is larger (or smaller than its children). A proper implementation can achieve that nodes, with the same set of transactions, obtain identical trees, minimizing the validation time once a block is found.
- **Hash tables:** These structures allow to include elements in a fast way, practically close to the constant time O(1). However, a traversal of the elements is not possible, making many of the applications difficult and potentially impairing the performance of other components.
