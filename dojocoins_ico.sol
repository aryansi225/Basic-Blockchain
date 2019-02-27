pragma solidity ^0.5.0;

contract dojocoins_ico{
    //Max number of coins
    uint public max_dojocoins = 1000000;
    //Conversion rate
    uint public usd_to_dojocoins = 1000;
    //Total number of coins that can be bought
    uint public total_dojocoins_bought = 0;
    mapping(address => uint) equity_dojocoins;
    mapping(address => uint) equity_usd;
    modifier can_buy_dojocoins(uint usd_invested){
        require(usd_invested * usd_to_dojocoins + total_dojocoins_bought <= max_dojocoins);
        _;
    }
    function equity_in_dojocoins(address investor)external view returns(uint){
        return equity_dojocoins[investor];
    }
    function equity_in_usd(address investor)external view returns(uint){
        equity_usd[investor];
    }
    function buy_dojocoins(address investor, uint usd_invested) external 
    can_buy_dojocoins(usd_invested){
        uint dojocoins_bought = usd_invested * usd_to_dojocoins;
        equity_dojocoins[investor] += dojocoins_bought;
        equity_usd[investor] = equity_dojocoins[investor] / 1000;
        total_dojocoins_bought += dojocoins_bought;
    }
    function sell_dojocoins(address investor, uint dojocoins_sold) external {
        equity_dojocoins[investor] -= dojocoins_sold;
        equity_usd[investor] = equity_dojocoins[investor] / 1000;
        total_dojocoins_bought -= dojocoins_sold;
    }
}
