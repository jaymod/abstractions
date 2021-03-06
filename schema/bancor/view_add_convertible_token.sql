CREATE OR REPLACE VIEW bancor.view_add_convertible_token AS
SELECT "_convertibleToken" AS convertible_token,
       symbol,
       decimals,
       "_smartToken" AS smart_token,
       s.contract_address,
       evt_tx_hash AS tx_hash,
       evt_block_time AS block_time
FROM bancor."BancorConverterRegistry_evt_ConvertibleTokenAdded" s
LEFT JOIN erc20.tokens t ON s."_convertibleToken" = t.contract_address
;
