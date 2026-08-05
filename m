Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C047043A;
	Wed,  5 Aug 2026 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933306; cv=fail; b=ajFnQqAoet6TL1fTrlqsFFzTQssSPrcxkbNcNBbb3CAhEPqWH7BTcAq23/iqcc8x90VxUgmsdQ39t9G3K9rtEyfb++zSHz1BxyS7N12reihT2VBu6nFjPEXz4laGwRPxXjYE62uk1SIG6q5MUY4lkwlM8fSBBbnCcpevFkE+Qo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933306; c=relaxed/simple;
	bh=zZpwFS6jrP14RYJOhiJIMjFz31HyO2bkrVUqUq+gMA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GUVT/zhonICxUzNb+xufgEwi5x0HahL2hmwJ8A5i71PXJ4BXAK+fK9DeXF1H43pTCDu2L6n6Imm+x5bBeRN/cQ94kP29ltUNEHwyJsmHFhir/FVLgr6JU+Qpulg9yfq8wqqYFJpv5WOH+Qc+lnJXerGZ+Jh6r676voWXYZL9NdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=weOrFnVo; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="weOrFnVo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQKDXxA1RpoFjuWKSL8LiyH8MBN4QjjN7bNGRZru6WVK3afGFcZkjWR/+P75c46MJwDZgegVWI+i+aIAvo78I4/WiUytgdi5F45upbQ8DWYW/FeKo1u9As7PQVekjeNdvKe91alE01lAJ02mnW1hEsbQp1Sb6Keh8lzbrwGtJZxujb8BR87Np5AotM2c16Usl1v5nMunj0VFEKR0vJwxL4/gEbDII32zC79vadt5IQ4M68tgJD0pIpK1gyrNdwxwx6jR8tKz6XkOusnzoyHKVER1gVV+AkeKjLRtjjnrqvyUMku1SHO9Jptei0w5U4FDOIodaFpkSbFtmLO1RQRdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDaXBo0suX5TtrxDytcpznhLGqRrwrA02KYekcB6jq8=;
 b=dOzedK9shHWSvaHTGKEbhL4KjnkfxIL0ERIwZxNwRvClr32kYa6a1M6eS+qPEsjLV2zXG2IIg9jH7Je9XGyNGcMD1ApHbSOrZ1QedG/d7OMlb49RrnVeT5GJPwmaH9hBRtfTXOmMMrHyh/YP5yoPWN1rdvXpHIRt7vAcYCRJbdknuOd+BNMuQvhDkxcjROVgTTIgj3hQAG31tOPm0VSyAYTJbjnVRI9hQ+z0SZzxOqmeMKGM1uHiOyeYjF4k+Q6iSL3CmZJMWwUkvzxYTxF88TlUHiRrxFotP4ErdcQAPAOYovjn6iVAVcamvSLKKYgNcWzrrnaFpfpGXh0zdhN5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDaXBo0suX5TtrxDytcpznhLGqRrwrA02KYekcB6jq8=;
 b=weOrFnVobwRvXNoIjc+p8+NlPX0YMnBminXHflysKIoVOLBoGdLANYJIAbUn9VcXmk8gEEU7VyqaOQgNvcFbb/6/6pm57R697utvZtBN1HX9uWN5EivhBuKOvV/mMH9p8aADWsUxi5EIBzVILk7FiMgAOdtNxKr/nTAPIqAnCEBbonDgcynafzYKvK65IynVsCszqMigfSEMuijaXcaaOEQ7SPXfyclhSSfDf7K55Y4v+UiAMnkY8uzDRRb0WisoG518gsxhu4/4NgZg/S5+0D13Kg4TwaGJgWPPkKcmn8EEvRw317YukbtiRoEaPzENfsGgZnu5mpEqNNeuGJqZFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:55 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:55 +0000
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
Subject: [PATCH v10 18/36] pinctrl: airoha: add missed IRQ resource helpers
Date: Wed,  5 Aug 2026 15:33:50 +0300
Message-ID: <20260805123408.3767648-19-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAVPR08MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 19baec30-f1d9-4f12-7886-08def2edf42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9PMqKjcsXh0q0bfXA+pybXqUZBhEsKGqi1wAplp4qu/6uQnpUMvtyOu4VG2rghycmnrc7B2k0ZDvvOPl1aXjsb37DLMmzMOnheUjPqu49qwNIcPlWH04C4D06ytmQpzlX/y3xLJJbfHDXVPi8QRPc8S2+dLhCD88Ds5EdC5WffQLhCXx8VlrkFp7gVVY2BHEVuB6weyaSo31dmBrs+fm5+aYlePtZ4+FDvHGdVX0n19EUh41jXIWEwLpw29mzEGMt1Evl78fJtlzz2Szln9R4xUu3LLIEkJusyzyVh9U9SB7e3plzLRABN7wlPbIzKK0zBjoxixOz7mNcK1geaMD5YMkstArRntbVYhh4/iRnozxbxVqlw7R4bVra7DMo6qcgrz3eKSAjl2i3E4sRRAu5OdyiK03vx/Wlt0+aV6wqh/4gmfgKQUjyEqALhYqc0ns3DHLAVY/MuwHuFIKiy3Wr1yunpROSXjFjk7hK6F1bvVQ5Gx+4IBT+9OcBlwwGqz22SknWzc2/4TcxFzvrpfdN1Q60NJqe9sKEfX5kAAdnTwhvovONiRtL7VQVGD9fW4IbBccBE46EmPVYEOJ1/zuPtokoa4uDNAw1tIK+M5fijr6LjAJHkqrgdhya1kGpL/bPtAS1FECaZuk+bx68x1mgz63XqNQtuaxPsgj6kB9xhZz2biSJWOCKkEWUQrLl17t1ixSn0tiCB3Gzca0Eut3PRQbXLJQFmEvN1Mg2DxI4hhTOt3gffDlvZia9YUEKzR0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Iwte+macmuMpfUsC8dcfnTGL4LBca4mrSQm89ByXZYGX1Q6SfOj20ixua2J?=
 =?us-ascii?Q?6hOFw4g92zp1LEIBt8OfDXehyVewqgQSNjjw/HgFNxWsTqlcuWvsaU1gPwil?=
 =?us-ascii?Q?vG/uJqhJekMZiNmvWcKM1GBvUTwA/dCGZ1ZWBcoas8yugN/rVNoW0ecXDIFw?=
 =?us-ascii?Q?plEeWb4gwgxIa43VMPL9dMsouSBRDSrMmwrX0SX+YD9ctAaWZ+sulwk4upAG?=
 =?us-ascii?Q?TXOVW8jn1bng1gd4fLz2AOE5EnsKFcQPsmhoSNWWYG+hCopwzs++Rt+KQt8N?=
 =?us-ascii?Q?oxkqa1gD0ZTxjX/Ucxh3CNtG/wp19ZgOMydRif2CESQ8BlTV1c4K+GdP+DmL?=
 =?us-ascii?Q?6UXgDGQx2UT6Ev/X3VtYZGAwJ9jNkMuJIs4BTeoLobkZBn5FzhYlLqXhVAse?=
 =?us-ascii?Q?/Vdb0uUyt2iysCfb/1aat/fD0yy0KzgQL2esmXuncDD4U84YCNHdszWkKvGk?=
 =?us-ascii?Q?O0CmoN9oYi8ds8YCuZS+EWyRGWR5XzOAjzvJekSeubfL7OaqJ1u2K0OnzXTW?=
 =?us-ascii?Q?VFvwDGsCBltCzqstY7rJ73G9RH432MDb0Hjvbc4HessdFeho0fGLpq+hI4p5?=
 =?us-ascii?Q?B8iq49Fol8Rl++irz01DRp0I2SxfaQPw7VwH76MIty8OdUT90VbBLvdGgo2e?=
 =?us-ascii?Q?wLbyTd/wuBfoCYFBBYqvB3smjLqhOQLrrlKLVdoQbGWsRa3oKqHe39zEGPKH?=
 =?us-ascii?Q?siVXfrLIrbH3FDosTWB29i4dNYtuXX1W+ziuMR8/VEnHiqyTR+PvwjyQ0M+k?=
 =?us-ascii?Q?v3WP+DhKYNNrcrvt5FJBEX+vKFnODQIBbzBzUV0XC3K8jg28DRCZT1C0WPeM?=
 =?us-ascii?Q?Az1Agl6fUukdFGgeOQ5+uV33UDd1nZVECU59aaVPeMWi+C4I04NXjgVVyaYl?=
 =?us-ascii?Q?LLvDrjGaKavCEGYbsJwRtMzXJC3iIxsetItIwm1cnlxXYDHnIB8PKGJo8Bu+?=
 =?us-ascii?Q?wEec/O3YKiRMQ3beQms4vIx2ItPMOQ9nlTOp/xKfQWV12JxDwfUUi2qRGlkm?=
 =?us-ascii?Q?Gdar4rLJwpeLo7KfPGXTpT3GHDB8YTp0+YA9/b4u2S7h0cwe4aGv6icNO8oI?=
 =?us-ascii?Q?EWPwUcW88S1kEII9zrL+eOqqv3W1niJxBfcdFqFWT9CUj8Xe+R4ZvRFJ3YV/?=
 =?us-ascii?Q?L4Z7qLczLr9QtCihG2xTq/0+r435l/9BA49A3P/P8rLhC0aciXUvgEf0bWHJ?=
 =?us-ascii?Q?J9S4RWMhCcxRIFlxKZ1vNASDS/dt/HpsT+BTVnndvzPs7L9qifcgvunwpuZ0?=
 =?us-ascii?Q?NRQrIVdkw1AFp9bYSI/5t7RWkkbQ9eFvc4CiByIEwOS1iSqgF5PL0mW/08Mt?=
 =?us-ascii?Q?XcdFTzPgRb3Ly/L32zBpsMqzNbl6upOiKp2JXb5oiY01RtRsc1wRXnDvOAYe?=
 =?us-ascii?Q?OnQPHrxzQxmlf8f13SgNs0kfgmfyz5/eZHUuImMSFSZmyT/7NEgFVc/uboBx?=
 =?us-ascii?Q?3tPZEDV35mJuY6kdP14snrujRkNs32UU9LGEwzzTSaR3HapoOwFJEoxMCztd?=
 =?us-ascii?Q?V+Hr4Xzn+0IRujNAvN/uPrBqiql+1xq2SFI8mh3i8kYnNwJxRUe1+o2UJkxL?=
 =?us-ascii?Q?N/tzJrp9NAGQVT6PAtsxVI3MTqo27AUfINlwPs75GYP1rcYx0D6f8USiPqsj?=
 =?us-ascii?Q?GPutTnT5XgLCTNxjQ+x6XKeSgtV5ZVVP/4RI42na+IPhg1TYu/qLgbMA5AdF?=
 =?us-ascii?Q?FXVHG+LDQoshUCnibgYaUWDudi90Lq4Odshzi6d2lhG0hubCilc7kVqQbAQB?=
 =?us-ascii?Q?mySGl2yRX3RwvxwnB5SDhzvIRZoGkFo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 19baec30-f1d9-4f12-7886-08def2edf42a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:55.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66szENv5cgWZQTIzrNC35WjDdtfdyOuKZ2F7Z9EdHfhz3ttEh+SyUJH8/YOzFj4oVLxccPzJOZ5A/wssKNmInf2WCegbmP7Mq//qqRdv0vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 0f2837320d1ca..c64f3c9a35acf 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2689,6 +2689,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.irq_mask_ack = airoha_irq_mask,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
-- 
2.53.0

