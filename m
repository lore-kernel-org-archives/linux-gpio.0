Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012037.outbound.protection.outlook.com [52.103.23.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F63C9454;
	Sun, 26 Jul 2026 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082431; cv=fail; b=nr2rb8+zLU5V13iDJvERst6XqL3aGeZeUeimLHzPyYMeayleK7FIlfnp6uj83BQyKT2f1TBjIeMfX+kctGWLVcor8nOZMt6ECImtcMFdMWs0jku4Ievq76UFdEhd/naPkFMIQgIp5IsmfneQ1C3w/J65S7GEtOGBY4qC/nPl+Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082431; c=relaxed/simple;
	bh=BqSi0eR0/+N5PuJpHvoAtNgfi6VLgt/NZYELt1ktU3k=;
	h=Message-ID:In-Reply-To:References:From:To:Cc:Date:Subject:
	 Content-Type:MIME-Version; b=pyBYx24B3uGMIWJ5VrOv9JmJY1vGCBIGsmXdFZfcP+IS1hVxmHmE73nbwUoW0StCHDh8ul0EvIFJq0TuetiqfqLlfLevLVJBajwXPvU7CnwbYK71ENj1DYdaFh2QxVIhU/mozTEP9QFoqQiQyXw4Wr82wGe6Dx5D13YeaCsTMSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RGn+VGPF; arc=fail smtp.client-ip=52.103.23.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RGn+VGPF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX+Wb52SXguepn4rHNlnHff5kOy1ZowTuua+yohTjg/bLGSkdocmxGzzeOmwbb+liOhT/OlkWMjUNq6mn+jSqKKoBeAswU/R8m2MDwfuZsDwwlQwpRjvWn8lY86Uh6nvmTKYmLEl2WXv+frnUwUuK2z+C6vB9DkUJiDPFnXPu2KluQLKTVqahLmNFrAZAvVGF8VJrqfhAHRbOESOFxrDVOn7DHe+li88D65XZAchcuTj4kMIXs06NJvGF4WzeDwzUPdIsrfRVznWWW6Ohc/NZdm+8NRPJstxBUn38CQ1KEXcRs38Ml8C4zO609BLTbxUHAuhjdBzENDMN6Ne/G/B8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=;
 b=SK6OG1FUfQdVIEZQkT2PeoIv63lWZ/VttQmQ2nZ8/GAdLAzw7xgTAiqPcEyl1ZarZKVSU/9byAgOlpE1dCsOjehuDX9GZTxXD2Ao2tzMbkuCtxF165zwN/Ew3N1p49vHPeQmCwcQ4v58LmRA6Ro47D89dJ/Z8R1A+jiemkV7aEfrII+dlF6QP1Z9gWplv30e1au73WQY54cc/inXrdFdcSkb4KT7+iTyW/lgQhCDzQqOIVl30MHTfBWD1XFF9S+4wf01TG8CwebRMWI5xTPhPMq4XL6xy8RFiQOBAq0yE9Om0ciVrR2S2WmIuPDjkKo+jIYLWmpbKSuCc474AvRswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwLvHbFMsrnvIb8/HywdysqQLGBUS88ozn6AgAuahnQ=;
 b=RGn+VGPFFYzjZXsWjpYnmdk0g9EW1ifTVi6g64q2KRCOaSVc1aGyulfmiFdfz32HnZ9XjTqXDo5lGh9q9ejDs8iERsOtwCg8VYrQfyOdG1NDNlSqUgSedTCocwycVsBST2McxXNAG/lUzTS5+RPcIpk6Vnce2FBKf1law3knryVACOKIVJjWI+7JqEgPm01AqNc7/xtJjlk3/3TNZqAo/CZrB0I4CKnJfsqoEPAZNkM69Jgw9UV60yx8zscKGTLjjN+JTP6iQvwx2yZeT1+bZL5VTuHL+swScxyghbVi0nWHqsR1nroWf67uRXRXFVoUBrF0sWzR3p011JsaB7UEtA==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sun, 26 Jul
 2026 16:13:47 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:13:47 +0000
Message-ID:
 <MN0PR19MB60911808D97295FFDEB04003ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 23:49:03 +0800
Subject: [PATCH RESEND 4/9] dt-bindings: pinctrl: stm32: add STM32H7RS
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <178508244881.28466.9849090368386221666.artpi2-resend-4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: f73add4f-30ba-4332-fcad-08deeb30df3f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|2604032031799003|704163111799003|8060799015|19110799012|37011999003|12121999013|23021999003|15080799012|51005399006|24021099003|16051099003|25010399006|5072599009|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sVqREtoR8IZB5SbySguxxLpFMy5YJwjlG5Xw+XSATL4oiiQKvHTdgD8Z4zPt?=
 =?us-ascii?Q?Mbnz0hiLWl/k+ENqWgTCZ2SxYvZDlyneGjgKLWmar/U6otJU4bCYYiYSRJ6z?=
 =?us-ascii?Q?7TI/JWm6G078IswbmeBNZ5f58hGY3IJ9lRFMXFOW2VgWxJ+sXXmkO4FrFPom?=
 =?us-ascii?Q?/5k1gqrB2wun+oGnTy/zJ5a9QIv1/VVDOzWZGlfz3uLMQMsex+gqbbBvA7rW?=
 =?us-ascii?Q?vMkYhoQqZQBPHhxdRgi8/50+pLpApNVVckQz/zk1I+uiLf7FYZAiVsKKiM7R?=
 =?us-ascii?Q?2Zf5kyg1Xb2Ur7zTh2LGrQsNJptYzHhSL9YyOq+OhXbxXBpvKwULxSGX2BHY?=
 =?us-ascii?Q?pNOgdUN4lhhuzlZ7nIte4pSLonQSR11RwP3E6SLP8x5OdzR1LvbsdV5FNvoP?=
 =?us-ascii?Q?Puygp4AwWRtqjyEP9eepOA/lGDFfKi5THJ//G4HZrr0YewQ/b8KpBp4TEaoA?=
 =?us-ascii?Q?mwXg7rwRCSrZnR4SjUV7Djas0rVNi5JMHWHlue6+yDSS8X5JFKDqRjxAcLWA?=
 =?us-ascii?Q?4IhyxAK5jLBBVQjW30/F5x5Oczn5MnqgbP1qAg9KrQUHKiRsUM3PHatHrNCB?=
 =?us-ascii?Q?nL3v4dYlY7/OpDa7sX0Lx/x9SqMnfJfKWvt1B/YYFuQwyFbus/81KUwnp0Js?=
 =?us-ascii?Q?X1eJg7wIK0nStd1Hl+blk4BRE3LEbz7KMDd59FMeEStkfNDBEhmTKZGJ66H0?=
 =?us-ascii?Q?bcdgq8PON1sCVP41K6lqranXKg/6+Dkhh2d5FNqVPkbBUZNcPRHbuTDzGSix?=
 =?us-ascii?Q?ziTbyWn5HljvNRqKPEdFM09ospwVgIxApcpShmJt6Ze65cARdffpmnG+QpHQ?=
 =?us-ascii?Q?DtwSBZQa+pVxmvOMDuiysRuZdBsxa1rO/hDcpXRmPzezJr3w2+LI5SI9xcbK?=
 =?us-ascii?Q?HIGyU68AQFouOA15+/n4fdHHmVTjN3/4dSOPLK4i845HMg+5RFQFymqybvIp?=
 =?us-ascii?Q?5POFqvuwNd4648wj6dPLJC4us9YrXE2ktZDQdnTCdApf76Ny4vKJEJIprfWt?=
 =?us-ascii?Q?Fg8KhIMnnlKIK/VPiXLXccCGp5T287DPFpGGiGIetr1PpVyauiwWpj+vKiCx?=
 =?us-ascii?Q?xK686R/7q/3/JEtmkR/XmLwVf6AqFIOy4AjiuUSbabjGFu6ZvN0Juot2ciog?=
 =?us-ascii?Q?HP4fH9rg4YkB?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BFsHt4r0SJGj7usw1jm9Jfcq0qL1QiOz9arg9ei+0iGxq/p8IShcgs5ZhujT?=
 =?us-ascii?Q?g/ibabLCgGeyHlzD9UtkM6hHnEpZUDGPkQHZ77OGCnovWBZKf8Bl0apcNVQ9?=
 =?us-ascii?Q?ZnQGrTA5mahXOogfP6rTPz5y47OXt5Awpm2UYufFQ9H2L5f7gDbyUR+T/pAR?=
 =?us-ascii?Q?jDiRLdi4kHSWiPJmODRtbK+HjP8GT2D6mU0Rwh8D+331K1aq9EQHTROxk3o4?=
 =?us-ascii?Q?StybLnWIDCnXh4l+xCe8FtfwMGa3wiOEvYboDj4almNm+YUkSB7wsiGSV9S6?=
 =?us-ascii?Q?RnGBhfwCMr4SyNkOSFmoktXMmhfNM6v+j0723CLAEInc3T+UCszXuQfsK+E2?=
 =?us-ascii?Q?bI5VKql1MlwJJDuPi43kS9KAIJrYrki5ubzcHSFEUD0Mb/xPfyf3pl9aG3hg?=
 =?us-ascii?Q?4VkMG+GrUrDs/T4fGy5oTW15J+N1yMOiM84UeoSScUikdtU+hgUKbP+6Iv5O?=
 =?us-ascii?Q?G01M3iouyLLkSePljodxZjSYyxMIEhBo1tsZ2AZHniOVoBF8A6Pp1t+G8vq2?=
 =?us-ascii?Q?YLF3l6heqg9BSiOye3VWizupb+DhFdR4jgz3fKskM48MdM5IxRnjJE828TI0?=
 =?us-ascii?Q?JwiXdCJLkcu1IYjD8n2Z2Dwi9TZ/la7Rkm0ruhR9Y5nTf/2rMVZliOuvvdFG?=
 =?us-ascii?Q?P4BitelrR7OTuJ7AFk9AmND1UUkGthiYqR2kseVSZCR6KXjUpbPR05So/yrM?=
 =?us-ascii?Q?0lKAIXmdMuaF3KLssBuYLJAcVuZy78yOuf0J4kk2RuoNQHZrry3bAedrnTKQ?=
 =?us-ascii?Q?qOCoRmjJX88QJYUkDBVi7Ovw+ZfH7pMdEA3ydqBx0vYtC5KMp28cG/PWn15A?=
 =?us-ascii?Q?cgzsHZa9uS47AUtbKV8kI/R6s0zO3RSXm4FoolJRQLC4idHwD4xud0FkVruf?=
 =?us-ascii?Q?vrWu4JnmYIdNV9eFEf5QFHDEjPF11bnfVFFTfXuX+0Lgem6po7Mtx7+/58h5?=
 =?us-ascii?Q?kmaBWX+BN9KFqHO6CO4c0/vDJ7KCiWXB4RH9DTRWsJM2fKOQZreipy7n20Oy?=
 =?us-ascii?Q?cW27v7lsXU5s3cwXdW72OKdg43c3MLbcvYusvMDvRzkZrWq0TWRAb3Iu9PzY?=
 =?us-ascii?Q?sZ77VI47uWU0TQmcO42toaL51OSh0TqxyZCSYxPxniKWNDKqBes3KWQTQJGb?=
 =?us-ascii?Q?/2rBw/ekrtHq+dgw8dEy8JPSe4L6qs69W2SfF5kXFCyn0oUN5pfU8ip9LoT9?=
 =?us-ascii?Q?3FbbJ4w4iLkXn8n0YYV2wJ4BjZCjIbZD3gUJQuASm0WrYefYZCiCT1mSEM5k?=
 =?us-ascii?Q?iqosTnzbsfshOeaodsVMlf+3QiITjjauKPDt5QPx+7IwAFGOypLQxvnDKM5l?=
 =?us-ascii?Q?MINnRDqgAUbzMGwaSIhItQ9ZI5HLHzPqurPaXeYiiLfffIdO+hMgQIP3LOe1?=
 =?us-ascii?Q?3K96tuU7syjOjQ5Z1hDflYDaDeLrwhPXtbkHBNXOB/BRPSuMcQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73add4f-30ba-4332-fcad-08deeb30df3f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:13:47.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807

Add the STM32H7RS pin controller compatible. The H7RS family exposes
GPIO banks M through P, so extend the bank names and EXTI I/O port
selector range accordingly.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 76d956b4a..6e74485b1 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -24,6 +24,7 @@ properties:
       - st,stm32f746-pinctrl
       - st,stm32f769-pinctrl
       - st,stm32h743-pinctrl
+      - st,stm32h7rs-pinctrl
       - st,stm32mp135-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
@@ -115,6 +116,10 @@ patternProperties:
           - GPIOI
           - GPIOJ
           - GPIOK
+          - GPIOM
+          - GPION
+          - GPIOO
+          - GPIOP
           - GPIOZ
 
       st,bank-ioport:
@@ -123,7 +128,7 @@ patternProperties:
           to select GPIOs as interrupts).
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
-        maximum: 11
+        maximum: 15
 
     patternProperties:
       "^(.+-hog(-[0-9]+)?)$":
-- 
2.55.0

