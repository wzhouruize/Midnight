classdef player
    %player object

    properties 
        % HOST PLAYER ONLY
        numPlayers;
        numRounds;

        % ALL PLAYERS
        gameID;
        playerID;                   % determines order of play
        playerName; 
        writeKey = 'RIB6JG6D34YM1BIQ';
        readKey = 'T9G3ZHI6RZ7KTOHB';

        writeKeyDice = '7BGI8AFJZYYJ8EED';
        readKeyDice = 'V6LE1Y58XD8ZX7WR';

        numDiceLeft = 6;            % number of dice in hand
        rollCount = 0;                  % number of rolls the player has made in the current turn
        roundScore = 0;             % current score, then sum of all dice selected to be set aside
        currentDice = zeros(6);     % array of current dice in hand
        savedDice = [];             % array of dice values to save
        savedTurns = zeros(10, 6);  % 2d array of final saved hand of previous turns

        playerInformation;
    end

    methods 
        % constructor
        function obj = player(varargin)
            switch length(varargin)
                case 2
                    obj.playerID = 0;
                    obj.gameID = varargin{1};
                    obj.playerName = varargin{2};
                case 3
                    obj.gameID = varargin{1};
                    obj.playerID = varargin{2};
                    obj.playerName = varargin{3};
                case 5
                    obj.gameID = varargin{1};
                    obj.playerID = varargin{2};
                    obj.playerName = varargin{3};
                    obj.numPlayers = varargin{4};
                    obj.numRounds = varargin{5};
                otherwise
                    obj.playerID = -1;
                    obj.playerName = "Not Set";                
            end
        end
    end

    % setters
    methods
        % set savedDice
        function obj = set.savedDice(obj, diceToSave)
            % flag to reset saved dice
            if diceToSave(1) == -1
                obj.savedDice = [];
                return;
            end

            % if there are no dice saved, set dice to save as saved dice
            % otherwise append dice to save to saved dice
            if isempty(obj.savedDice)
                    obj.savedDice = diceToSave;
            else
                num = length(diceToSave);
                obj.savedDice(end + 1:end + num) = diceToSave;
            end
        end

        % set numDiceLeft
        function obj = set.numDiceLeft(obj, val)
            switch val
                % flag to reset number of dice left
                case -1
                    obj.numDiceLeft = 6;
                otherwise
                    obj.numDiceLeft = val;
            end
        end
    end
end

