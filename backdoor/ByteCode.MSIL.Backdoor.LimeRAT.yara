rule ByteCode_MSIL_Backdoor_LimeRAT : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "LIMERAT"
        description         = "Yara rule that detects LimeRAT backdoor."

        tc_detection_type   = "Backdoor"
        tc_detection_name   = "LimeRAT"
        tc_detection_factor = 5

    strings:

        $persistence_mechanism = {
            02 2C ?? 72 ?? ?? ?? ?? 7E ?? ?? ?? ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ??
            28 ?? ?? ?? ?? 16 16 15 28 ?? ?? ?? ?? 26 2B ?? 7E ?? ?? ?? ?? 72 ?? ?? ?? ?? 6F ??
            ?? ?? ?? 7E ?? ?? ?? ?? 7E ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? DE ?? 28 ?? ??
            ?? ?? 28 ?? ?? ?? ?? DE
        }

        $crypto_miner = {
            72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 8E 69 16 31 ?? 72 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ??
            ?? ?? 0B 07 73 ?? ?? ?? ?? 6F ?? ?? ?? ?? 0C 08 6F ?? ?? ?? ?? 0D 2B ?? 09 6F ?? ??
            ?? ?? 74 ?? ?? ?? ?? 72 ?? ?? ?? ?? 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 72 ?? ?? ?? ?? 6F
            ?? ?? ?? ?? 2C ?? 72 ?? ?? ?? ?? 0A DE ?? 09 6F ?? ?? ?? ?? 2D ?? DE ?? 09 2C ?? 09
            6F ?? ?? ?? ?? DC DE ?? 25 28 ?? ?? ?? ?? 13 ?? 28 ?? ?? ?? ?? DE ?? 28 ?? ?? ?? ??
            0A DE ?? 25 28 ?? ?? ?? ?? 13 ?? 28 ?? ?? ?? ?? DE ?? 06
        }

        $downloader = {
            73 ?? ?? ?? ?? 0A 28 ?? ?? ?? ?? 7E ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 0B 7E
            ?? ?? ?? ?? 72 ?? ?? ?? ?? 16 28 ?? ?? ?? ?? 2C ?? 7E ?? ?? ?? ?? 2C ?? 72 ?? ?? ??
            ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 16 28 ?? ?? ?? ?? 2C ?? 06 7E ?? ?? ?? ?? 07 6F ??
            ?? ?? ?? 07 28 ?? ?? ?? ?? 26 72 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 26 2B ??
            06 7E ?? ?? ?? ?? 07 6F ?? ?? ?? ?? 07 28 ?? ?? ?? ?? 26 00 06 6F ?? ?? ?? ?? 14 0A
            DE ?? 25 28 ?? ?? ?? ?? 0C 28 ?? ?? ?? ?? DE ?? DE ?? 25 28 ?? ?? ?? ?? 0D 28 ?? ??
            ?? ?? DE
        }

        $network_communication_p1 = {
            16 80 ?? ?? ?? ?? 7E ?? ?? ?? ?? 6F ?? ?? ?? ?? DE ?? 25 28 ?? ?? ?? ?? 0B 28 ?? ??
            ?? ?? DE ?? 00 7E ?? ?? ?? ?? 6F ?? ?? ?? ?? DE ?? 25 28 ?? ?? ?? ?? 0C 28 ?? ?? ??
            ?? DE ?? 00 7E ?? ?? ?? ?? 6F ?? ?? ?? ?? DE ?? 25 28 ?? ?? ?? ?? 0D 28 ?? ?? ?? ??
            DE ?? 00 73 ?? ?? ?? ?? 80 ?? ?? ?? ?? 7E ?? ?? ?? ?? 20 ?? ?? ?? ?? 6F ?? ?? ?? ??
            7E ?? ?? ?? ?? 20 ?? ?? ?? ?? 6F ?? ?? ?? ?? 7E ?? ?? ?? ?? 15 6F ?? ?? ?? ?? 7E ??
            ?? ?? ?? 15 6F ?? ?? ?? ?? 73 ?? ?? ?? ?? 13 ?? 72 ?? ?? ?? ?? 72 ?? ?? ?? ?? 73 ??
            ?? ?? ?? 13 ?? 11 ?? 11 ?? 6F ?? ?? ?? ?? 11 ?? 14 72 ?? ?? ?? ?? 17 8D ?? ?? ?? ??
            25 16 7E ?? ?? ?? ?? 28 ?? ?? ?? ?? A2 14 14 14 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 72 ??
            ?? ?? ?? 15 16 28 ?? ?? ?? ?? 13 ?? 11 ?? 16 9A 80 ?? ?? ?? ?? 73 ?? ?? ?? ?? 26 11
            ?? 73 ?? ?? ?? ?? 17 11 ?? 8E 69 6F ?? ?? ?? ?? 9A 28 ?? ?? ?? ?? 80 ?? ?? ?? ?? 11
            ?? 6F ?? ?? ?? ?? DE ?? 25 28 ?? ?? ?? ?? 13 ?? 28 ?? ?? ?? ?? DE ?? DE ?? 11 ?? 2C
            ?? 11 ?? 6F ?? ?? ?? ?? DC 7E ?? ?? ?? ?? 7E ?? ?? ?? ?? 7E ?? ?? ?? ?? 6F ?? ?? ??
            ?? 17 80 ?? ?? ?? ?? 73 ?? ?? ?? ?? 80 ?? ?? ?? ?? 1F ?? 8D ?? ?? ?? ?? 25 16 72 ??
            ?? ?? ?? A2 25 17 7E ?? ?? ?? ?? A2 25 18 28 ?? ?? ?? ?? A2 25 19 7E ?? ?? ?? ?? A2
        }

        $network_communication_p2 = {
            25 1A 28 ?? ?? ?? ?? A2 25 1B 7E ?? ?? ?? ?? A2 25 1C 72 ?? ?? ?? ?? A2 25 1D 7E ??
            ?? ?? ?? A2 25 1E 28 ?? ?? ?? ?? A2 25 1F ?? 72 ?? ?? ?? ?? A2 25 1F ?? 28 ?? ?? ??
            ?? A2 25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 28 ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ?? ??
            A2 25 1F ?? 28 ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 28 ?? ?? ?? ?? A2
            25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 28 ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ?? ?? A2 25
            1F ?? 28 ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ?? ?? 8C ?? ??
            ?? ?? A2 25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 28 ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ??
            ?? A2 25 1F ?? 72 ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 72 ?? ?? ?? ??
            A2 25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 28 ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ?? ?? A2
            25 1F ?? 7E ?? ?? ?? ?? A2 25 1F ?? 7E ?? ?? ?? ?? A2 28 ?? ?? ?? ?? 28 ?? ?? ?? ??
            7E ?? ?? ?? ?? 2C ?? 7E ?? ?? ?? ?? 2B ?? 7E
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            $persistence_mechanism
        ) and
        (
            $crypto_miner
        ) and
        (
            $downloader
        ) and
        (
            all of ($network_communication_p*)
        )
}