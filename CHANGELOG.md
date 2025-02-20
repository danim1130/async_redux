## [2.3.0] - 2019/11/19

* Global ignore in the StoreTester constructor.
* Better treatment of wrap-errors that throw.
* Breaking change: LocalPersist (instead of Saver/Loader).

## [2.2.0] - 2019/11/15

* Breaking change: PersistObserver became Persistor (and other renames).
* PersistorPrinterDecorator. PersistorDummy.

## [2.1.9] - 2019/11/12

* Saver/Loader.

## [2.1.4] - 2019/11/10

* PersistObserver.

## [2.1.3] - 2019/10/30

* Removed deprecated ignoreChange. Use shouldUpdateModel instead.
 
## [2.1.0] - 2019/10/27

* Better translations support for UserException. 
* Global WrapError in the store. 

## [2.0.6] - 2019/10/07

* Added sync_async_test.dart
* Doc warning about async reducer returning completed future (missing await). 

## [2.0.5] - 2019/10/05

* Better typing of StoreProvider.dispatch and StoreProvider.dispatchFuture.

## [2.0.4] - 2019/10/01

* StoreTester.waitUntilError and waitUntilErrorGetLast.

## [2.0.3] - 2019/09/21

* NavigateAction tests.
* Navigation arguments.

## [2.0.2] - 2019/09/21

* UserExceptionAction.

## [2.0.1] - 2019/09/19

* Fix: UserException.dialogContent accepts String as cause.

## [2.0.0] - 2019/09/17

* Breaking change: ErrorObserver API.
* StoreTester parameter: shouldThrowUserExceptions (see <a href="https://github.com/marcglasberg/async_redux/issues/20">issue</a>).

## [1.4.3] - 2019/09/15

* Alternative: Use AsyncRedux with Provider (package provider_for_redux).

## [1.4.1] - 2019/09/06

* Flutter Awesome badge, and Pub badge.

## [1.4.0] - 2019/09/02

* Fix: dispatchFuture getter in ReduxAction.

## [1.3.9] - 2019/08/31

* NavigateAction.navigatorKey getter.

## [1.3.8] - 2019/08/30

* Alternatives to the Connector (StoreProvider static methods).
* Waiting until an Action is finished (dispatchFuture).

## [1.3.7] - 2019/08/28

* ModelObserver and DefaultModelObserver.

## [1.3.5] - 2019/08/27

* README improvement.

## [1.3.3] - 2019/08/26

* StoreConnector's converter and model parameters.

## [1.2.3] - 2019/08/23

* StoreTester timeout message.

## [1.2.0] - 2019/08/22

* Doc improvement. StoreTester improvements.

## [1.1.3] - 2019/08/21

* StoreTester: waitCondition and waitConditionGetLast.

## [1.1.2] - 2019/08/13

* README improvement.

## [1.1.1] - 2019/08/10

* Ignore actions in the StoreTester.

## [1.1.0] - 2019/08/07

* Correct stacktrace for unwrapped action errors.

## [1.0.9] - 2019/08/07

* Error message improvement.

## [1.0.4] - 2019/08/05

* Store tester.

## [1.0.0] - 2019/08/05

* Initial commit.
