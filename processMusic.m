%Store mappings from artist number to artist name
tdfread('data/artists.dat');
artistMap = containers.Map(id(1), strtrim(name(1,:)));
for i = 2:length(id)
    artistMap(id(i)) = strtrim(name(i,:));
end

%Store mappings from user ids to node numbers
tdfread('data/user_artists.dat');
uniqueIDs = unique(userID);
n = length(uniqueIDs);
userMap = containers.Map(uniqueIDs, 1:n);

listenedMap = containers.Map(uniqueIDs(1), artistID(find(userID == uniqueIDs(1))));
for i = 2:n
    listenedMap(uniqueIDs(i)) = artistID(find(userID == uniqueIDs(i)));
end

%Generate adjacency matrix of graph
E = zeros(n, n);
tdfread('data/user_friends.dat');
for i = 1:length(userID)
    E(userMap(userID(i)), userMap(friendID(i))) = 1;
end
Esq = ((E*E) ~= 0) + E - diag(ones(1892,1));

%All a and b values below have been precomputed via a call to
% [a b] = mpleGraphField(artist,E);
numTrials = 1000;

%Lady Gaga = 89
%a = -0.481, b = 0.0700
%Both stats far above
gaga = getIndicator(89, listenedMap);
zEdgeGaga = sum(sum(triu(times((gaga - tanh(-0.481)) * (gaga - tanh(-0.481))', E))))
zTwoEdgeGaga = sum(sum(triu(times((gaga - tanh(-0.481)) * (gaga - tanh(-0.481))', Esq))))
zMCMCEdgeGaga = zeros(numTrials, 1);
zMCMCTwoEdgeGaga = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.481*ones(n, 1), 0.07*E, 3*n*log(n));
    zMCMCEdgeGaga(i) = sum(sum(triu(times((S1 - tanh(-0.481)) * (S1 - tanh(-0.481))', E))));
    zMCMCTwoEdgeGaga(i) = sum(sum(triu(times((S1 - tanh(-0.481)) * (S1 - tanh(-0.481))', Esq))));
end
%Generate Figure 3 of the paper
%histogram(zMCMCEdgeGaga)
%histogram(zMCMCTwoEdgeGaga)

%Britney Spears = 289
%a = -0.6140, b = 0.0960
%Both stats far above
britney = getIndicator(289, listenedMap);
zEdgeBritney = sum(sum(triu(times((britney - tanh(-0.614)) * (britney - tanh(-0.614))', E))))
zTwoEdgeBritney = sum(sum(triu(times((britney - tanh(-0.614)) * (britney - tanh(-0.614))', Esq))))
zMCMCEdgeBritney = zeros(numTrials, 1);
zMCMCTwoEdgeBritney = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.614*ones(n, 1), 0.096*E, 3*n*log(n));
    zMCMCEdgeBritney(i) = sum(sum(triu(times((S1 - tanh(-0.614)) * (S1 - tanh(-0.614))', E))));
    zMCMCTwoEdgeBritney(i) = sum(sum(triu(times((S1 - tanh(-0.614)) * (S1 - tanh(-0.614))', Esq))));    
end

%Rihanna = 288
%a = -0.715 , b = 0.1090
%Both stats far above
rihanna = getIndicator(288, listenedMap);
zEdgeRihanna = sum(sum(triu(times((rihanna - tanh(-0.715)) * (rihanna- tanh(-0.715))', E))))
zTwoEdgeRihanna = sum(sum(triu(times((rihanna - tanh(-0.715)) * (rihanna - tanh(-0.715))', Esq))))
zMCMCEdgeRihanna = zeros(numTrials, 1);
zMCMCTwoEdgeRihanna = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.715*ones(n, 1), 0.1090*E, 3*n*log(n));
    zMCMCEdgeRihanna(i) = sum(sum(triu(times((S1 - tanh(-0.715)) * (S1 - tanh(-0.715))', E))));
    zMCMCTwoEdgeRihanna(i) = sum(sum(triu(times((S1 - tanh(-0.715)) * (S1 - tanh(-0.715))', Esq))));    
end

%Beatles = 227
%a = -0.3550 , b = 0.0310
%Both stats within middle
beatles = getIndicator(227, listenedMap);
zEdgeBeatles = sum(sum(triu(times((beatles - tanh(-0.3550)) * (beatles - tanh(-0.3550))', E))))
zTwoEdgeBeatles = sum(sum(triu(times((beatles - tanh(-0.3550)) * (beatles - tanh(-0.3550))', Esq))))
zMCMCEdgeBeatles = zeros(numTrials, 1);
zMCMCTwoEdgeBeatles = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.3550*ones(n, 1), 0.0310*E, 3*n*log(n));
    zMCMCEdgeBeatles(i) = sum(sum(triu(times((S1 - tanh(-0.3550)) * (S1 - tanh(-0.3550))', E))));
    zMCMCTwoEdgeBeatles(i) = sum(sum(triu(times((S1 - tanh(-0.3550)) * (S1 - tanh(-0.3550))', Esq))));    
end
%Generate Figure 4 of the paper
%histogram(zMCMCEdgeBeatles)
%histogram(zMCMCTwoEdgeBeatles)

%Katy Perry = 300
%a = -0.6150, b = 0.0890
%Both stats far above
perry = getIndicator(300, listenedMap);
zEdgePerry = sum(sum(triu(times((perry - tanh(-0.6150)) * (perry - tanh(-0.6150))', E))))
zTwoEdgePerry = sum(sum(triu(times((perry - tanh(-0.6150)) * (perry - tanh(-0.6150))', Esq))))
zMCMCEdgePerry = zeros(numTrials, 1);
zMCMCTwoEdgePerry = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.6150*ones(n, 1), 0.0890*E, 3*n*log(n));
    zMCMCEdgePerry(i) = sum(sum(triu(times((S1 - tanh(-0.6150)) * (S1 - tanh(-0.6150))', E))));
    zMCMCTwoEdgePerry(i) = sum(sum(triu(times((S1 - tanh(-0.6150)) * (S1 - tanh(-0.6150))', Esq))));    
end

%Madonna = 67
%a = -0.5400, b = 0.0860
%First stat far above, second stat within range
madonna = getIndicator(67, listenedMap);
zEdgeMadonna = sum(sum(triu(times((madonna - tanh(-0.5400)) * (madonna - tanh(-0.5400))', E))))
zTwoEdgeMadonna = sum(sum(triu(times((madonna - tanh(-0.5400)) * (madonna - tanh(-0.5400))', Esq))))
zMCMCEdgeMadonna = zeros(numTrials, 1);
zMCMCTwoEdgeMadonna = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.5400*ones(n, 1), 0.0860*E, 3*n*log(n));
    zMCMCEdgeMadonna(i) = sum(sum(triu(times((S1 - tanh(-0.5400)) * (S1 - tanh(-0.5400))', E))));
    zMCMCTwoEdgeMadonna(i) = sum(sum(triu(times((S1 - tanh(-0.5400)) * (S1 - tanh(-0.5400))', Esq))));    
end

%Avril Lavigne = 333
%a = -0.5580, b = 0.1020
%Both stats far above
lavigne = getIndicator(333, listenedMap);
zEdgeLavigne = sum(sum(triu(times((lavigne - tanh(-0.5580)) * (lavigne - tanh(-0.5580))', E))))
zTwoEdgeLavigne = sum(sum(triu(times((lavigne - tanh(-0.5580)) * (lavigne - tanh(-0.5580))', Esq))))
zMCMCEdgeLavigne = zeros(numTrials, 1);
zMCMCTwoEdgeLavigne = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.5580*ones(n, 1), 0.1020*E, 3*n*log(n));
    zMCMCEdgeLavigne(i) = sum(sum(triu(times((S1 - tanh(-0.5580)) * (S1 - tanh(-0.5580))', E))));
    zMCMCTwoEdgeLavigne(i) = sum(sum(triu(times((S1 - tanh(-0.5580)) * (S1 - tanh(-0.5580))', Esq))));    
end

%Christina Aguilera = 292
%a = -0.7810, b = 0.1060
%Both stats far above
aguilera = getIndicator(292, listenedMap);
zEdgeAguilera = sum(sum(triu(times((aguilera - tanh(-0.7810)) * (aguilera - tanh(-0.7810))', E))))
zTwoEdgeAguilera = sum(sum(triu(times((aguilera - tanh(-0.7810)) * (aguilera - tanh(-0.7810))', Esq))))
zMCMCEdgeAguilera = zeros(numTrials, 1);
zMCMCTwoEdgeAguilera = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.7810*ones(n, 1), 0.1060*E, 3*n*log(n));
    zMCMCEdgeAguilera(i) = sum(sum(triu(times((S1 - tanh(-0.7810)) * (S1 - tanh(-0.7810))', E))));
    zMCMCTwoEdgeAguilera(i) = sum(sum(triu(times((S1 - tanh(-0.7810)) * (S1 - tanh(-0.7810))', Esq))));    
end

%Muse = 190
%a = -0.5430, b = 0.0160 
%First stat on the edge, second well in the middle
muse = getIndicator(190, listenedMap);
zEdgeMuse = sum(sum(triu(times((muse - tanh(-0.5430)) * (muse - tanh(-0.5430))', E))))
zTwoEdgeMuse = sum(sum(triu(times((muse - tanh(-0.5430)) * (muse - tanh(-0.5430))', Esq))))
zMCMCEdgeMuse = zeros(numTrials, 1);
zMCMCTwoEdgeMuse = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.5430*ones(n, 1), 0.0160*E, 3*n*log(n));
    zMCMCEdgeMuse(i) = sum(sum(triu(times((S1 - tanh(-0.5430)) * (S1 - tanh(-0.5430))', E))));
    zMCMCTwoEdgeMuse(i) = sum(sum(triu(times((S1 - tanh(-0.5430)) * (S1 - tanh(-0.5430))', Esq))));    
end

%Paramore = 498
%a = -0.4530, b = 0.0480
%Both stats significantly below
paramore = getIndicator(498, listenedMap);
zEdgeParamore = sum(sum(triu(times((paramore - tanh(-0.4530)) * (paramore - tanh(-0.4530))', E))))
zTwoEdgeParamore = sum(sum(triu(times((paramore - tanh(-0.4530)) * (paramore - tanh(-0.4530))', Esq))))
zMCMCEdgeParamore = zeros(numTrials, 1);
zMCMCTwoEdgeParamore = zeros(numTrials, 1);
for i = 1:numTrials
    S1 = isingField(n, -0.4530*ones(n, 1), 0.0480*E, 3*n*log(n));
    zMCMCEdgeParamore(i) = sum(sum(triu(times((S1 - tanh(-0.4530)) * (S1 - tanh(-0.4530))', E))));
    zMCMCTwoEdgeParamore(i) = sum(sum(triu(times((S1 - tanh(-0.4530)) * (S1 - tanh(-0.4530))', Esq))));    
end


%Compute how many times each artist appears in the dataset
%ArtistIDs
%Lady Gaga = 89, Britney Spears = 289, Rihanna = 288, Beatles = 227, Katy
%Perry = 300, Madonna = 67, Avril Lavigne = 333, Christina Aguilera = 292,
%Muse = 190, Paramore = 498
popularity = zeros(length(id), 1);
for i = 1:length(id)
    popularity(i) = sum((getIndicator(id(i), listenedMap) + 1)/2);
end
