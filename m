Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023137.outbound.protection.outlook.com [40.107.159.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284B239F168;
	Tue,  4 Aug 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854633; cv=fail; b=GVRspo3FXXXdHfXu/hLlLWEndToFrMqhl/0vHbLGqncgNYQBJMPzh++6MuIK9X1arF0E8u9DEHB66LcdFki9bx6w6CWG8fy6wsqxzb1RV1QeuUdHsFRzS/He13nYbjLt4vI/4mQmT8H/11JyTp8d51GhBIdi5hIVf9KUR5d4H0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854633; c=relaxed/simple;
	bh=NsFaUDYP1YzxF5UnVTOAgewjO/C1AkrqUCbZCBMTG0c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ADaKOnc2r+gLGgjDc8MEuS+jvBJtoNnKzXRWvnAtojsRcqn0OQx0FtTs6IlVcwF7Tq10bLYdvrI+Pt1zQ7si3j+BKV4e5OQu450WcXVMOyZWelFcbhAzQzJkK/4pXHCkWARirats/Tyj+ryFDQVvZaTAtGmzPN2BTR1sFKmOMos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=l7DIoRIl; arc=fail smtp.client-ip=40.107.159.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="l7DIoRIl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjBZRaQ5TuDo4441KTeY7JZSBSnVMw4amlvYQ/gNinaXJRCMvNZNRgU12JaQKZzUKu8P/wVqPmQYl8XstZRYjmTiAh3cSrG5hv2R2144DCiAyf2aHO2rbKDvUWkA9Oi87nRTmGk9eO1j0hmoEH8F2VS3cD7qLnae9S7zTag9+rkZo6VPkY4q6ylsF3oLQOFIP9nTPA+xLVL9crWDOhOPJjNEwU9mWh6z8ElyMo5kiSK3eiCuQva6nyesJbVoeXNdBpyWHF+2AqMfbulWzyU7peV57HBuMbJx8KGF6rhlitv7Ko6w+fembIxspQz4U62rw50tLgGvSUveF8T1Iwk9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5bWvi6ykthzl7ggK9SqN1JOT9wDhVQTnCPUpppGeiU=;
 b=jGrWB0y5TPh/ciTo3xCxA7zeRNR9iDj+bGpMiZaelwH9f0AhXS/2dQsELBhaOndkpoUTbjXNAtQJVMDZRQKnqd2rNKMScQ6CwGDUqFBMjRr5clii/PQKyGUMlKh9JrGGWlsmG7B5zjmv8di8ZSZYFsj/8zoKMC7J4NiwtYk8vILxEj01cLwYfu7Tmt+nB74gUWVp9yAmxRVJajsEWE56E+cOlhmmdxfYpqvr0qGm+BuhJJBgLLn6NJZyf2NjzvRZBezZpJnJPM+zqP+Pu7CAO61as69tog9d3dQ44Hhs/2JtNVCWP7sNmiNetbSSty2/3E7k8yhJNjfWMYE5A37b1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5bWvi6ykthzl7ggK9SqN1JOT9wDhVQTnCPUpppGeiU=;
 b=l7DIoRIlk0v+fkFhsFtaLj0jq4TgEOCLcHBVINWxulIbu/MTv+LBbeTTpyetPUd5zIxTnqJ5XZkMYW8KvA5LNn3K/37BTBiIb8aiNmNNwzDZyaXCq/Z0wNUwJW/Bxt57uzqa+LRjIn/dgabwRFpGDt3Fo7XEm0b6HlS0PWuYomCXxBQbiKKQLHqiIPH+WhdmnlzbV3eOAgSMJOiPRpch0r/iEvSkpzhQb48AIyyqIm3feg0CVLMwji5DIBDzpRWNiD9W0vaOahbcQMs//EH71nnEaKjwdkjqHOX9jENhOtrVJ6lBoPVDjXKmcxsKSW+D1Et17pah2WLo04rhN6ExzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DB9PR08MB9753.eurprd08.prod.outlook.com (2603:10a6:10:462::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:43:46 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 14:43:46 +0000
Message-ID: <d92137d6-5dde-468a-95ec-3acc506444f9@iopsys.eu>
Date: Tue, 4 Aug 2026 17:43:43 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 30/35] dt-bindings: pinctrl: airoha: an7583: add olt
 function/group
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Gothe <markus.gothe@genexis.eu>,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-31-mikhail.kshevetskiy@iopsys.eu>
 <20260727-chivalrous-legendary-goat-b9ab93@quoll>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20260727-chivalrous-legendary-goat-b9ab93@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVZP280CA0074.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:274::15) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DB9PR08MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: fb16adda-dfd9-41c3-a10a-08def236c9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DMwekxCJDb29fify8VOochrzzai803eu+cIvymjGE65qz70/ujnuPOngZ4mv+yWH3IJyV4yftwdLHF65BTYXimLUcsIVdIV7faeTZCQehXduTdGQoN2emwreLyoaeufOj4HvbfLNiIrkuz75Is16gtOtOZDexR4kyPLujowib4ylWfs+1jckQOMBqDLwii5b+BQhh7gU38G6btuwWBmacWLtXBQBk5bMv2jLUbzmamJ6lJus8/uYusP6zJqMG2GLTn+Jbre+jZV8Vt8bVHTnFoIIGbCIqZbYCrhFPx88H5HGbXcnxzU3AQpfTkukOeDg5RuE1DTEODAW4PA7RpoQ1YK1EqSsqOXyisz+MMbXC4C9fjdoRw99Rl0bMCKOgydHxPZ75zOAUg/gS5RRwl4yqn5UdZUzALO/m9GR2ul1jV1Yv/R08h6LDdtdzSi470mNZlk2RI0DeNqWRWJLMyAEe0UwvvVB8RqG05RS0qWFdINdzzLHYFMOzJmu8dc6eZF1nziAp2Nogm+szXl1RZCg6JLDg6/4GgNoi24Ht04H0ujiJZOfPjvGNeTEDpvEenctFU8stOwLLWV8bX6+OyuMx4GHE43gY1gymfcPpM1IvG24B5OKI/1q6rbgA959bdxCt5rWPYPRhHH8J80e7JbGqPiRlEBjT1lCD3VINdpwfLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05aKzVwUG1BNWhGTHNPQjNZTkdqTFF3cTFzNUt3T2pMVkM5OGNaOTdNNXRp?=
 =?utf-8?B?SE9XUWZHaXVGUjFLbUNpV0QvQ2dWZVpSUlBxYVlEYUhTQWNRVUp3UzkxUTZZ?=
 =?utf-8?B?QVBXY0lYK3RPZ1lSQ3FVYnF1R2ExR3o0TXJGUWNUdm91VmthTy9hN0phUlhX?=
 =?utf-8?B?WXJ5Y09yV0lYN0NldFF0eG5jNXZQS3dET0JwQzFDSUVqUU11R0M0TVJuL1cv?=
 =?utf-8?B?Z0RKK0NybmlnYll3UjN1VUpQY2lQOStvRkJlNGpzeis3Ykoza0tqY1JHOVVu?=
 =?utf-8?B?dUExUS9MendZN2VLUTFHclM4R3psRzFmcXE3ZWkvOCtrMGJkTGhLdUlJUS9K?=
 =?utf-8?B?WE9DT1lPQ2hQUElSQzZVb1RKNTdDM3BoR2k1WTNjV25KbmQ1SDNqLzJGajMz?=
 =?utf-8?B?cFJ1V2pKYUd0Q0gvcDh3NmN6SGVPTVNFelFRbFpyZlVHNWlvbVpjcng3QzQw?=
 =?utf-8?B?ZW5QUkw1VzV3ekZUalY3bE91eGIwbEZXQnJUQ28xWm53L0NIZUhFTWJ2Zkti?=
 =?utf-8?B?b2hhamRSR0VRaVRaKzVXODNqaDMyQ0dyZ3VNcmF2VnY3YzVTa01YajZyNWpv?=
 =?utf-8?B?NUQ2UHRkVHRGV3JKNFBLWXBhZEpUQVFqb3dKMklYRzNON0pJK2lITys2bjZy?=
 =?utf-8?B?MTdQSGMxcHg2am5ORHlnanJ1TlRSMW9JVnNpU2JzR0FpTXY3bzFGSzUveCt4?=
 =?utf-8?B?UHlONXJiVHEvT2hpMVMxVVh6dU5ybDR3RnJMNi9QTk1ENWNhekV2OEthdGk4?=
 =?utf-8?B?anJiREc3dHkyQ0VOYkFDOVRBZkhVR052TnN0V3ZGVjBTTm5NdktzL2psQmVN?=
 =?utf-8?B?TTZ1WGxTLzRIYlZzSXBUdXc0U2doQkpRNUFBbUo3dUY0VitjN052UXBvVDRj?=
 =?utf-8?B?Z2tXWS8yYmJuOGRWTUJ4M1ZzNTUwcmF6T1Z6dGVJMFRrL2Q5NW1EQ0hHMGpw?=
 =?utf-8?B?WWJGZWNIMmlMTFRTbWJBRGxOeXlRUU5tcG8zRVFibjdsblRKN1RRRVdhb1lQ?=
 =?utf-8?B?QTY5dmF1Qm5KbnphTndSb0VsS2xwaVMwenNHbXN5OUVaRFRZOHJsdjluRm9n?=
 =?utf-8?B?SU90OXJyWTlpVlFOU1pOVHQvVis0ajBaekI2YmtDcjdDQnZEbEZCaXdsU2ZB?=
 =?utf-8?B?Um1IYkV0VWJlYmRVRDBQZ2lZZFFMOHk2VDRXYTRodm9XUFlBbXhLalMxclVk?=
 =?utf-8?B?NEtrS2U2Qjd4cFRqVUpYK1NzSjlBY1Z6VDErRVkzY3I3blVwRit6RGFaRTY0?=
 =?utf-8?B?d3JrSnA1TWQ3YTExblMxd2hrM1dIU3NGYUNkNW9zUmxnaUJOTWw0TzRiZ2E2?=
 =?utf-8?B?QXdOamE4WE9nYTd4Rk5LbktmaUFjb1JnVUNKYVh4WkhyTXZwb1VBZE5wQjVR?=
 =?utf-8?B?OHNZc1JtekJoZUV6by9nZmpveFJXUGZkaGhWQ25NMEtEdzF0V0hPbnFJcVJw?=
 =?utf-8?B?N2VIeDBDaSthdS9IcXVvenAvZkxFU01kTDBRZXVycXBkSnJRekRvUjlHa3Q5?=
 =?utf-8?B?NXUzZkYwQzhESXZqUGhiLy9NRDZxWnhWU1NjL1l4SHZvUG9uWWZ5S3JPaDVY?=
 =?utf-8?B?V3RZL084TmpvOE1zRjBZRkYrd2JLbUhGa0pwRVhLZ25pRkF4Z0szdTAxZS9w?=
 =?utf-8?B?Q0xLNkMvSlBtUEd6QXhXRWl3cW9URzY5OXUzK20ycG5BT1NydkZLWmtRNk85?=
 =?utf-8?B?MmlDaDA1MlI3TDRtMUJSZ3pibjVqWVFwNWFnYStGQTJVRmNDSTR0ZVNSTkVi?=
 =?utf-8?B?Y2wxT3hpM2hvUGpuV01yc3RyT3AzWFdEMGRRRFpMNUNoYlY2L0NncldIY25Z?=
 =?utf-8?B?UXFYTHpFTmpkeGhUVTEwa0lMdTFoQkdGcm5rRkhiTHNpU0p5SFZFR0JSd2xU?=
 =?utf-8?B?ejR3M3VZRGgzckJ5WGhJS1hoWEUwSU5hQWFVZ0d4R1BlaTBmdVFDdlZLY1po?=
 =?utf-8?B?Ui9sTGMyRlZLd2kxbUQzZWtRclNSR1E3SWlzU1A1bGgyNUNRUDhFZUNhM0tv?=
 =?utf-8?B?cW1zQzFGWVVuQzU0K0kzVmRSdFRJdWdXSUhvNittVzlQL3ViYllwOC85Q2Y3?=
 =?utf-8?B?WkJ4eDBwTEtBSU1TRVp1akhkTzhhT1FoaGRCanplNFplL0M4KzZuZTByNlVa?=
 =?utf-8?B?dER4TWZXdTVndjZ6YXVTQTh4K2tqUDB1cy9hamc0eVJFbkdTaitHNTdaSC9z?=
 =?utf-8?B?MWZMRzBFMjBnY20yamdOMVlTR0tITU5uVE1TWFluQkVYNHdRa3M4eEFHSHhM?=
 =?utf-8?B?bnJ2Wjh2OVBNRFRWRFlFSUVWSDUzbGhUdWJINlBnZmx3Ync4RHlBNUJWN1Yw?=
 =?utf-8?B?eUZkUTMvQjlkZTJoU1pycWZudjJYYjRETWlxNnQreFdtMDhwU0R2Q2RNQkRx?=
 =?utf-8?Q?qcxQTpewcdiKETrQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fb16adda-dfd9-41c3-a10a-08def236c9f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:43:46.5869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MS1Mc91WqOT+3dYhNTF1XfrbBS9DTeIpBlE5Rs48SpdDYr9Qbm9Aq2C1XnfRZxxeqXeaL2o1NkM1AsCwzLsdcZipoxHVEOliwohzrPgHhcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9753


On 7/27/26 23:15, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 08:41:36PM +0300, Mikhail Kshevetskiy wrote:
>> Add support for olt pin function for olt pin group.
>>
>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
>> ---
>>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
>> index 7deb48db52c3a..f016e0da65a57 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
>> @@ -60,7 +60,7 @@ patternProperties:
>>            function:
>>              description:
>>                A string containing the name of the function to mux to the group.
>> -            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>> +            enum: [pon, olt, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
> You just changed this line in previous patch, no?
>
> Why binding patches are spread all over instead of properly grouped?
> This makes it difficult to review. Please read submitting patches (both documents).

I tried to create a separate binding patch per change. Could you clarify
your suggestion?

> Best regards,
> Krzysztof
>
