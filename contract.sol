pragma solidity ^0.4.18;

import 'Protocol/contracts/core/oneStepGame.sol';

contract VRHuner is oneStepGame {

    /**
    @notice constructor
    @param _token address of token contract
    @param _ref address of referrer contract
    @param _gameWL address of games whitelist contract
    @param _playerWL address of players whitelist contract
    @param _rsa address of rsa contract
    */
    function VRHuner (
        ERC20Interface _token,
        RefInterface _ref,
        GameWLinterface _gameWL,
        PlayerWLinterface _playerWL,
        RSA _rsa
    )
        oneStepGame(_token, _ref, _gameWL, _playerWL, _rsa) public
    {
        developer = 0xNoxon;
        
        config = Config({
            maxBet: 100 ether,
            minBet: 1 ether,
            minRndNumber: 0,
            maxRndNumber: 1,
            gameDevReward: 25,
            bankrollReward: 25,
            platformReward: 25,
            refererReward: 25
        });   
    }

   /** 
    @notice interface for check game data
    @param _gameData Player's game data
    @param _bet Player's bet
    */
    function checkGameData(uint[] _gameData, uint _bet) view public returns (bool) {
        uint playerNumber = _gameData[0];
        require(_bet > config.minBet && _bet < config.maxBet);
        return true;
    }

    /** 
    @notice interface for game logic
    @param _gameData Player's game data
    @param _bet Player's bet
    @param _rnd random number
    */
    function game(uint[] _gameData, uint _bet, uint _rnd) public view returns(bool _win, uint _amount) {   
        checkGameData(_gameData, _bet);

        // Game logic
		_profit = _bet*2;
		
        if (_rnd==1) {
            // player win profit
            return(true, _profit);
        } else {
            // player lose bet
            return(false, _bet);
        }
    }
}