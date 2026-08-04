Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF908477293;
	Tue,  4 Aug 2026 16:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859499; cv=fail; b=ihIB8W/wfOS4ZUY1srXBfa4LMGTvwgETvobh8rZSbrxzdxA8Y2e4wKklSHMmGlV3ZvdQS4k7lQbBk8dP/wEgxYBKDd4YW76c9oGMbiiJ9P8rVI2Z4izZFhS3jXpUxpExQme0unHoqzUZFZbae1kDJQZR6jW827Fov//i5NWcwXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859499; c=relaxed/simple;
	bh=ff1wgyO31Rt/ws0GnXdUiDSHlpH/uw0CB4tw97/2PA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uUdXScVn0NWScpoRxjeKZuFdVxxt8QIYGiTX0TwwXnCA8ZL6iU3imHg7hI3byhSzyORsn74zULn9x1PGQgOSEKaEztPz86zUcXTIHtWAY3xWo13+EsLwft+9t/pBAEHQ1zTKAT93HQZumPIUE8giZvAJmLw3DtCxEHR5tkc86xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=X30hgxsy; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="X30hgxsy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKWxG6GAG4eYtgbS9x5r9UuCF3MeQSS5GArEFLtVGIwwOEwu+LzvXSLOg6MWHv8SHhvt4x97bLPqrpbSG4yLT9xrmmF/ivIetKlSCyGtZ7dzfUc9osWyRzFkqA+i2Q7GW1PIVjTwOwX0znFfwO1TUk7Bb4g4hQCzgVpXrZUHQApXe19x5UV80HBRTln9EFdLphhTOOBGVvCxxtpCkI+mr2yfVf2AstnxEfKwZFK6q/CCujDeb03fHyL2O8DbybwKCUsPbjhe3npNcrl2zvj8awa9P+N2wV6fQlFlfFJI+04oWbJMINlBObXKMaKjKnXuKtkvCkqP+CptqoZayAhNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58OFInlsuXMddJEzbQ/pESSN3qMBCPwTNYV/5X3RixM=;
 b=vV46pAs+6FiJ4NbK7qRVMKoMYfPtubbceeUrhyFBtpTOTmy+a8LHt+SFwY9TuMzqWd6c3SPbv7acOWne8CuYjJNU75iyGI69+0HDzSIBu2zfFaxM/1er32d+kvtuYtBgFAHv7RoIcSI/X+WTjI54EI1klQVTO4n8H1LMZ6mfeObeX95l+fm/n25tzy8hNrft09ArTNHHd3FlR69BO4R3dmAA2Jskd3p3UeAXEEU4hyF7vRC5cL52uiB2m9dr46Easzmr3hrsUePKErUNZDNC15z6J5GK4NvcTh4bPcqdqobZhAN/uF1d92fnZ/1SjgIKVN5daEk+Unvyiv42Apsh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58OFInlsuXMddJEzbQ/pESSN3qMBCPwTNYV/5X3RixM=;
 b=X30hgxsydxIX7CMqMZEC7FWc7lAJNvtSI4+opBykaJAlyvaNMfYIaN10eVy2n3s/8gfJlHrUEA0GLnBY49GbbxQ8bw6a5twsjFrdAjvkli/rT2NurPTiKrFQJ/nNTHm4KIBLgX+Mabq613liDu5QO66qhs5ptmGI10OrEbrwGVGkfCE0aH/N2EKfo5Zhle2c/jv59vgX2IwKpASjjOwv7jkeQEe642mNjkNMk3GPWP17JLCCzhG89sgVwIMINi0nXpHL9vi1+GRMOyuH7cICAz2el1K/hCM8R70+YIAlMec1TFTrL0vkfIRvSJXlxa9vfAI444gZ3jPvMSosj/lEKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:52 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:52 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v9 13/36] pinctrl: airoha: an7583: fix spi group pins
Date: Tue,  4 Aug 2026 19:03:56 +0300
Message-ID: <20260804160419.3592327-14-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: a06a0a77-366e-4915-9dd2-08def2421e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NGwy4ldno3Z7Ss2MD5UZG4+12emoq3/kDAQ/2PKwiDzDfZDvtwbsiyzSW1/nMe7961qLDFQPlA8DaPJYS5bdSXFSe+qObPo7BzzEUvoKYXZ6B9r13fNyKCJQs59Ro69Z1f0SnWdk6TblHaCDuRWQe9uZUCERmDqGCn4doaIxMdvvELBcHgPUG5L+9WTxvu/5TP8+yp4JszKlXZzCiZqndPgqEHG1UfSCTVH3mf9U2Im2KzDvKZ742INfYYe34QzPkQa6JNQJjNTQ8CCqioEkDzvuFql8FyYsw0iBW9xMdu5jJ/4Y27Uluvs3frDaNu4/8OMIcpnow5ADzoUipbU1PqLhQYhCQBTntMpvNbtHhJkT2dHMpnTVBshizXwfbwGg9uBNph5F953IZJsl+E9lWqARC5sIRRWp0g5HMQVYJNKr5jEGhJS6+PDV55L6ehonIGjjqZal8EokHu8sJ4c+vLwJxxdDkoAzz1trGUfLPt7EVEBkAYzkokM8Ex8NsAHPQuZkP0klPmYWXmw2+6utLKzoJFMS4a59Flq+3nHLsmXUf3+qoh4GHOveW4clvsXSbGOJ0tNWQzzapqeeU7es3DrjVmRK9EyU5b84Ge/FLJi1Iq8m4V5EHLhBUnsIzl42id3GHAkpw/Q8aIVQTzT88nRDL5hirxBCxJ/OAxXiEjT6wQA9lTxlcRDCNywPAfSu55/KkdpgMsAnGkhK5feIRdqWzgd1ua99n6XDRicDLhHfUsAnTPx7eNLx/2GXxTVO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KKkic911L4r6kwmj5EjjTpYnKLR6ZYnIM0PcSZTJYd8yH+oy7qMmP0VDyUm9?=
 =?us-ascii?Q?LebJmSGNPbuD2jJ17tEUUmdjpOYPeTkA6EMcMPKHj4tzc80BQtMv5HZbZI3R?=
 =?us-ascii?Q?7A1ow1xD4sdz8kJurZ3ty8+nIpuXfN3cnyh8Ru6EVmYA9hsCbdBalL/v0ynB?=
 =?us-ascii?Q?x3rAejhB/Bl6lKbTlzjK6kO3aLGiTVve1CJN7WZM8pW0r1PSCh/oCYqL2pEX?=
 =?us-ascii?Q?AdQP2rFn7e/x8fpyVd4dNXUGEFJMze5QvJHXGYJBYXQTRUUkhiWMVjZgcbY8?=
 =?us-ascii?Q?0eN13ZjU81GWZ+1GGmhacCbvpW8C1n9J8fF5b31nSktU6Y6tfCX7K0qu5Z5W?=
 =?us-ascii?Q?TX1rFIv3zjxraMf8v5Z98JBJbDbqREKAQNdJSxqqTck/T30TeadTkpcU+WvL?=
 =?us-ascii?Q?zaMgYcGtqctkczfgUXnWrYDUe/zF6CLt3uJzzanfTA3h4iL4BImKAeetwYVy?=
 =?us-ascii?Q?tsuCAp4Z6BvWVR9gU5dYoPG7Pb8D48PFR+zef5rVJcw3st/5vSYv92X2urwG?=
 =?us-ascii?Q?tS2+bupqWz9eM7YrHud+0HG6TeugOBOXN/8uwyHSBFxX4XXQNLG1B29zTgEV?=
 =?us-ascii?Q?u+VuKlELCoc9rO1/CqkmNa0qFHX9T3LxRa3LG1HkPJzjjQUoHAAWJmiGOrcX?=
 =?us-ascii?Q?hFRBWpom3cZbOwXcexAEKn/RCJeR4JKW7dF5orKRqJDJX4YPv8pD5vuFzRHa?=
 =?us-ascii?Q?NbQpUrAW2sgW6xOAYm+SXYIWCrcX7xZL+CMVxPQ2OXOGzOmqrPp2veltADos?=
 =?us-ascii?Q?QuMTsm2e6Mx/lNj9WkwAyJ9SN1S4hm3MdqfLBiGqYyeavusIn1dcz6PZGvYn?=
 =?us-ascii?Q?MSKAWJLZBMolnYBpGzlGNkt+P2PD/YVa+9Gd3mP8vcdkXhWsFBHajLvNqEkJ?=
 =?us-ascii?Q?63jrrR+tGf0+LqdIt5c0D1VMM/cB7NblM09ymqahHv+mtw7kKwpzRF5bkLcL?=
 =?us-ascii?Q?YgKUzbtB8324KTsjitpfek9vBT4YnwoEGZZkltjwLDmB2GxRYsyB0CqlV8oY?=
 =?us-ascii?Q?Jh6UuXiqFPlwNe3z6qXl7hqEPkPUBu8ApuRSifnQ9AXQpfzx6tSNDm/sAQvX?=
 =?us-ascii?Q?/lZk8bGA+fC7ggza/xc0R8FUgvNk5zHK5h8TiyNK/1DB9ysJeV1mCBsNtg0H?=
 =?us-ascii?Q?EZ1mi58w9GM6qn2pnSGYwnQtGXHSxkTqiUGVuCKll8xBT9y2k98m0sYiWcok?=
 =?us-ascii?Q?eoPSq1Wo8A0kHrX7UQR5sQqMu7geahC3geY7vj0vtAhlHh1ufNjI80YMu3t+?=
 =?us-ascii?Q?0zMyBHR147dw7SfBqiKEiEWCIjE4o4wziGY5EhoQOkRRyJ+V/nLdkRgWTDVM?=
 =?us-ascii?Q?EyN0t+ocO3x1k5E3Iga2WJqFK7PBKsMT45eFcOy1Oh7byWaHnY+NknYn2EPV?=
 =?us-ascii?Q?VP3DIgeoJYhH4zzv7wGL44Az6W6iIO1xe2AcXC+J2h/evmwFwWWG3D7YKVIb?=
 =?us-ascii?Q?WpefRUKT57tkYnRKvGnPSIP4rnHY8AwM7+CplCBtszUB4UxMslg+uyLgmK/2?=
 =?us-ascii?Q?UMWPsJUBVh25jUEXgwHJ7vPSTGqR+hcaeiMGN3ljoUrGr0EkAYkuI2IRxoZu?=
 =?us-ascii?Q?FCWi2xaWI9P1nhL+yHWglJBTaa3ilNFrSv8Rk/VlbRHtu5djerrcEET/i9sj?=
 =?us-ascii?Q?wqqOcefpC7NsDouS1Paobyjoc2OzDfP50ziUrB63eEuADEf9hhnEGm7vynQO?=
 =?us-ascii?Q?DIfU52dWHbTq2cMN71a2KE8RvVi3+107TG+eJwSyadMVAwoYSbfnOuISfoVI?=
 =?us-ascii?Q?HYoYD5tA/iYkdthxi8U2kRF3rpHOsqE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a06a0a77-366e-4915-9dd2-08def2421e7f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:52.8525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAWlRekSGcjEL0RZG+u0xMbOAyhkVmHjEVKdixrKhJ6fIT4n4yYbl5BQrTKiIDK0jNXFySvNRpmazxOzz/iPdnwvZcvn/rtXNxsotY/ZRn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

pcm pins were used insted of spi pins. This patch fixes an issue.

Thanks to Daniel Schwierzeck for noticing it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e5ae703c0e0bf..ad6d24e39c868 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -739,7 +739,7 @@ static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
 static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
 static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
 static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
-static const int an7583_spi_pins[] = { 28, 29, 30, 31 };
+static const int an7583_spi_pins[] = { 45, 46, 47, 48 };
 static const int an7583_spi_quad_pins[] = { 25, 26 };
 static const int an7583_spi_cs1_pins[] = { 27 };
 static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
-- 
2.53.0

