Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792351;
	b=2gtEqIYGySf10S8LlHHUsxRtHpYActNu9l46MJPpQ5TycIt/26j0e4WT0dkbGnjxxDqM
	 8pMuzPUOrB75R4hgwkyO5pG25RnlmDAxIkcycA4mbODNyXLywVn+G5icL+s+9VzKymkFS
	 s0urwwt8dDvKCM++tj6pvEMkzoN/V98Ch1KiQ18i5q7IwbLNs9vy2gIwvcNYmhxjfiH9t
	 scx2AObHisgBabVNGK06laFkGM217Ekd6N63ErfOVIckByE9sUAaZnDFSa+Jqa0c+BzIo
	 Q8Bm3C+Avwi3GiYll8pJmTHk/Z3rjFQKNaKG1AEape+IlpPuQP0WS9uvhyj51vUzmTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792351;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ce0x1bYbthAlA4eBlNO+8Kih2ZJ0MSwKRA1L6Dt9iCY=;
	b=EXrnPKNBO5TAw5G2u+5CcgzEP/lrzmpIJq7uMg/sRGsPvQmU7oWbpR6/xHsqo0FZlIDV
	 Xr9vXEi9V9LR3to5zWuE0LEyIps8bJsTpFlsKcsj5qRFCgCROHMD4oRo3ZAk0I0kKKnda
	 apIh76lcDirW232tlIfpK0mBgZAllUBbZA3iP8VrkGtcX5aeQPefLQIodgneRBbSoKso/
	 0TCp9prS4pY01qSLJUh9NnTkGzydpoJjXlfa/5Pk122080YRdbyr7JSJ+qNW6BvVXN0BA
	 ufAzrbH/zFIP1sWSm+hgOHh4g2eQqngIOY4MMj71ZqY11T7YXh4+vXWCVCtV10aGjUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FzJN5ifN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.22
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1287F606A31B;
	Wed,  4 Nov 2026 11:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1287F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FzJN5ifN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXIFZ1z2S89rSmxTfn87457DITius/w8FAf6rZOTJdIqryIjIZXwUfrxrW8TjPjh5upadK0Ob0TVBqFBZ6lgHgr85VOZMNm5IUaevpS4tMpDZvQ330Nk59E6P1NYXvbW4qvpPIVP6x8rFnpPIqAW15a4yLykRQFiRk5SfM0OsB0JS8bzlTo+9zy44Kjogi6Le5wtKGNVoNUV+mjaJyMe6hHLLGNrHC6zAdfp/TRDq88VaLDKTBN4sVwPFV7qOLPlrnNy/78w17lqpfn0y+gSbXVtBu7NylEsrkLv3gOcNw1Jvudfr/dsOoDdMb9btr+hYA/Dkv7ym8oyrUl850Jo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce0x1bYbthAlA4eBlNO+8Kih2ZJ0MSwKRA1L6Dt9iCY=;
 b=vcfxPzVK3YdWu6DiwGFrNqUa/LLtC3kyZsVv5ww3fwQSGPUdicgA/WrEqIodCvkvywZC/p7977hJQRPIt2qiC+VReOR+k03xE5y7NLB8DozKQCWN3g5Gu+N+HxlTKQN5ugNWJPPRipBj+kDxTwbLj2OxuCTsDJHemJwPueczTDI34tfqQ35VnhfZa9gej7PJveiR3C9dDJwjqYmzzfm9mW5/nWBYZwcICpmtnnLBi6aylBt7p/ANNTDTcvc2PbsTqOfbqLQ3Sskxfu09Mx4JWamSZQYbAwx5/zc1MFQ27+izok8q7hqByjS9LeOZJ3FaKf/BlDLyodJGNLI+TIreIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce0x1bYbthAlA4eBlNO+8Kih2ZJ0MSwKRA1L6Dt9iCY=;
 b=FzJN5ifNoiqHDvmwjqB0g6vQZXGPWW4EiPlDVdRZAp5cNxwiXzPvjy5wiQQkmBbhAShzyBvqh6kshazrD9fGxCQbq42wOs4hOQWS9lSNXagLNltm2njNB5XrKPfEY5gkhTrRfAM0E1YYAVGf27+m/XLNA7bhGyj17X5i4UnDzEebqKqXXLgYlQNqSr6KdK6Erv2FwckEVBeuJBroXR2asvTt8ieHmMvU5R5/9aULEODufUoMFFcmxUFaKtpdBdhdAJJeEftXdsL2moWKFtdkc6enXqlihdxUneM6a8ASiUOd2O/0/Cp58pAaFjYQ8N6UGEJYWk4xRB/eHF8PomDCIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DBBPR04MB7804.eurprd04.prod.outlook.com (2603:10a6:10:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:39:07 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 11:39:07 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
Date: Wed,  4 Nov 2026 12:39:05 +0100
Message-Id: <20261104113905.96582-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::7) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DBBPR04MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2ca12d-74f2-471d-e344-08df3a683c06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	t4n9SCOw7sJ1HQOmvCnCo1lVLy42ApQtXvu1SbQWq0KeLM0hBDo6/nHpHfuuLT1sFzYBZzDtiDVmHp9g8qww8fN63lmQ+0VVdepT3x/ikWylZnh1S3Bf465lSQDR6Pds3IOzGIw0/XrcB9jO0e9cc1ORkKkESp5cCKgLJgDDvw9RFds/aNqKc9uCATvlOsGprEzCHTeupUBjSinBhU23FjK2vHaYe/aEimufSEgJyEJK9t+im/Cr25mYOZbivytZEkXAxLvWIQ8XRZYkqpi29Gt4yXdK8r0/J7/KkZBztMxgOyhkBpo/mjlJ2qxbb2xdW/fdvsxrFjXlZkS0UwFZhY+yDJ/96eGSvAJHbWWaAQotK8UDIRNOfa3u4Bptyr76p38S90meXe4lRTAMryJvpz0/ihXTm1/9W+fkLPkQf5suo/pLdfuZEHCAD4KI+q5+qSPTUqZSCl1cy6f/dS8KgAAteR/YDx7jNAxLqB0npzxaLQwnkd4yoyImioDvZ3BvPDE9qXpLMLHwWjOZfW1d7PTBRGICTHmxk4Jywyc31226CfUegDdCvdaiX380tr6TgUR/BTk0nxyBb/u0LNVcBy/6Uz/TthLhBZgMNYqwuL0rxXUwJ/GHdLXQRXjQ0pXYoTrAlB42WUv84e3lUGI7CyJuS3xGzeDzz0qVvG2ZqZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9kMHRSMlNHbVZhRDQ3aG1DdnZrY3dWemVHUVQyb2puUXpqa21XU2I0U3JG?=
 =?utf-8?B?NnZNN2tqYXRYeWR5dDNqUVlTdlFqNDZBOU5PR3dhbUpjR1U4M0hvUHdzaTZ0?=
 =?utf-8?B?azlrVW5pQXdtMHRhMkdqbXplR2VMZzY0YWs4UGdaOGE2WkJiZTJZK0Ivc3Zm?=
 =?utf-8?B?SjlzdHNNYThTdktsbnpON1lldHg4bDdmbHlHZ3cvazZrK1NuWEp1bnEvVEY0?=
 =?utf-8?B?Sk9BaG9pV0FMN2I0OGg0c3pxbEhwdDVNTTVIVUNtYU5xNVFnQnR2MEdpdmFr?=
 =?utf-8?B?aCtLMlVnQk5Gcm5mS21iRDIzMVpIeGZFbXpweWZ1aHZFb25RU3JUbFEvbHZ4?=
 =?utf-8?B?WXcxNjdTcTltVXVKOXV5c2x2ZzlYa3dwVkc2S0VBRUwzS1JvTG15eGNibXpa?=
 =?utf-8?B?Q0UxVUVoeGZvYi9VdG43ZTRWQnNIQnBodmZNdzVwVSszQmY4OFJpWlo1d1BG?=
 =?utf-8?B?ZEpHSDdVb3dubjkvVXFVMHRCQnRTaW50cjdmTkx1d1RKbzFZZzgrNWtSa3E2?=
 =?utf-8?B?TkhSK3BOYVc2VWxMaUxMSWREVFh3YUZVdzBrc09XbVdCOU5YT0ZIeGtscHBF?=
 =?utf-8?B?dGRIdzgvRkNGd2pWbTZUVjZHcjVURVJDZGFHZS8rMW84SGI4ci85bEZLQ2tJ?=
 =?utf-8?B?enMyakVmUTR4cUhyM3FNWUp1cnN2Q2cxSGRwa3hWS0xBMHhTWE5nT1lNbWNN?=
 =?utf-8?B?Rk03bnhHN002bWRyazY5THdoOERFR0krUEVIQmsrNjFXc2JQdCtpcUxxWmhh?=
 =?utf-8?B?V3ZISkZrenJpbGFyMlVQT0NkNDRzVHZKQlB0UUhVTFd4WW55OGdsdVZoN3o1?=
 =?utf-8?B?OWVhMk1oM2FzVjhnM0pxZGptVVliejhDZGc0bUQwR2c1MG5iaUFRY2JpYzZx?=
 =?utf-8?B?a0dPdWUzY2NUVUpDZFBxZzIrS2lHaDMxcll5VmZycmhSSmd1L0hrSkczL2s2?=
 =?utf-8?B?aDRweStVSGVLQ20ydERXWjBlRlJBSERWYjFjUGFqckgraVFUZW9icjU3WlNU?=
 =?utf-8?B?WkFxZSsxNDlUY2lWWGVJeVloMXo5V2FiSTBmNVMzYUhLNm5WSGk5em1iU3pk?=
 =?utf-8?B?SEJ3Z2s3N21jWjVRa1BQZlJUa2hFVlBNbzAwUklFQjMwOG95OEcrdVErdkVr?=
 =?utf-8?B?UktuSk1KcnRJU3BZQU9pbUF2UmUzYVRwWTBCUysyR2puSGZXcTJ5Nm5HYW1p?=
 =?utf-8?B?TForbTczOTRKUVNUcCthYWJwT0VzL3dxeTlBTDEyUjBpS0MyRGtwdndvTnA0?=
 =?utf-8?B?dGxIMGdPMkRqb1l0Z2tTWjdpR2NWV2JRWkJHc1kweVkrMHRodE9UQmM3Wnlr?=
 =?utf-8?B?Z3NZK2JpaENkOGUwUU5zaDc4WVVnSlRvd3psL0N1blF3TjRCSHRqTFFVdzZi?=
 =?utf-8?B?Y00yRzZuaVc0aGhFVXptLzk0b08rZHExK0wrN01valkzZEJiMjJhOU5xd2Nw?=
 =?utf-8?B?SDI5RTQrNHN4dkFBaDVOaFB0QUJZU3hUMmRNc2hhZlJTMndtcXg3dkR4dFNv?=
 =?utf-8?B?T3lTQ3FYSDQ3dlBQNzU2STRoL2lLbFdFTFQ0YnZMY0RsRGFYc2N1WVlrU2FH?=
 =?utf-8?B?UkhFUE9pVzJkRDQrSFNWQk0rcFhFUzYxL0l6ZFZYS1lnVHh0eGc5QTQ3eTVB?=
 =?utf-8?B?OWpmSlpOY1RVb3Ava2U0cGZJRlhOWk5iODArbVAxa1BxTDlGUFN2cWhSUVRS?=
 =?utf-8?B?b1ZwRm9oR2RoZURpajNWUXk5TXBGQ0dXdDBPMUJ6K0pyb1VNR0VvTDJlVGo1?=
 =?utf-8?B?OWkwRDI2OXlEbXdoeDNBRlhvMGh2azhBVE04SVNBVnVCcXpFZW52Q1AxZ0pB?=
 =?utf-8?B?RmZoRVp0MGZieW1NeENMb3BkSE5EQlFKdzRad1ZoN0F1M0JaTUZ1QlBFb2JV?=
 =?utf-8?B?UUNIRFRndTNlWWJReE1hTlhNd3hiQ2JDY05iSGpGYVpwOXFpNzFESXVGVEJK?=
 =?utf-8?B?UVNqV3VrdGJ5WmlXNXNRdVNBc080aXBsSVBERWlVNXZ3WXlMNHdkVDVYQ2hw?=
 =?utf-8?B?ZWhqVGZhTEpBZGEraFRXeTcraXNUY3B2aUJWdmk5cnZrQUkrK3Q0U0xCT2Jh?=
 =?utf-8?B?VFViMkpxMS9aM0ZieTJUckN4UVBiNnY5RThzSGtSeVA1VGJjeC9Ma2ZwN3lp?=
 =?utf-8?B?cFBjekpkdkg0Rk5Vcm9IdFRwM2FGMDlreXMrWlBYdWJucm95ZDhGNHJ6N0ZN?=
 =?utf-8?B?cnZJdGtPYXJZTGFhNVRZc3FhK0lqdGYzMzMrS2QzcHgzQTBFN1VHSGxkR0FF?=
 =?utf-8?B?UmxzZDJ6N0dwcmRuRDdhUW1rcHFyeUt5SXg4WEZJY01IbTByOGV0eVJmZW1U?=
 =?utf-8?B?dDVXZ1o1Y1pHYWhhY0YwUnNZb2U4cGNjaklHMGtvUndJeHM2R1cxU2ZzMHZI?=
 =?utf-8?Q?IxUPeAuKRcxA6Dm3OQ8EYwAovoDiSNz56D7l+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2ca12d-74f2-471d-e344-08df3a683c06
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:39:06.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiIIKhEn2rIVfFMhGV71hz4Ahcx6T2ssYiY5B4TdRazP4lsmdnhI962fcNxbXcJLuV9+LYwbYVaPxH1gdf4zf/LM9cLojRDyMQFomJGT5Kl2luQ+294tudWBCJ+fbUi0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7804

The SIUL2 pin controller provides the pin muxing used by peripherals on
the supported S32G boards: the S32G2-based S32G274A-EVB and
S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
some peripherals never finish probing and a defconfig kernel cannot
boot to rootfs on these boards.

As the driver is required by every supported S32G board rather than
being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
user prompt only under COMPILE_TEST.

v2 -> v1:
- list the S32G boards that need the pinctrl driver
in the commit message
- drop the v1 arm64 defconfig change
- default to ARCH_S32 in Kconfig instead

 drivers/pinctrl/nxp/Kconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
index abca7ef97003..d6d97c944b94 100644
--- a/drivers/pinctrl/nxp/Kconfig
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -8,8 +8,14 @@ config PINCTRL_S32CC
 	select REGMAP_MMIO
 
 config PINCTRL_S32G2
+	bool "NXP S32G2 pinctrl driver" if COMPILE_TEST
 	depends on ARCH_S32 && OF
-	bool "NXP S32G2 pinctrl driver"
+	default ARCH_S32
 	select PINCTRL_S32CC
 	help
-	  Say Y here to enable the pinctrl driver for NXP S32G2 family SoCs
+	  Enable the SIUL2 pin controller driver for NXP S32G2 family SoCs.
+
+	  This controller provides the pin muxing and configuration needed by
+	  peripherals on the S32G274A-EVB, S32G274A-RDB2 and S32G399A-RDB3
+	  boards, so every S32G defconfig build requires it to reach rootfs.
+	  It is therefore enabled by default on ARCH_S32.
-- 
2.34.1

