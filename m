Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021085.outbound.protection.outlook.com [52.101.65.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF88635C1A6;
	Mon, 31 Aug 2026 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202020; cv=fail; b=B8oGe/q0NpvOUxu8HZ2ou6oi9zkzXoUqp36F3qNpGGUX0uFvzPENNcuy/mL8lXohA2uelasfonOdwfW6fzHbc5yR+rwtE05LJfWrxJb+6qY6VoU3vGUmeTFobEFXB6rIEg4X2snCmB+/XEVOLT0EDdvP/XQK26H71UOzeYL1RcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202020; c=relaxed/simple;
	bh=0dULBfZvkxpGktmFukl4GwcQFTn7eZxiBE3TPNeF4Zk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sMgmIhBMLFf1ig0QuMV2zz26ax+ImQdzXfoYAeO0ZdiLdEJ22tbQr0m+3WLSTng7x1nsOzFxr3i2Zd7p7VCTHT7ti36oRk4CI1xWuZRZvY4dvmQOgNXjGtCU+j01aik4ZRIUN+2gHj17hIPYza0fPMGgqCvyz1dj7Hdkzt2jMM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=rMuXmxG8; arc=fail smtp.client-ip=52.101.65.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="rMuXmxG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQ6vnjPG/u8XHbOeBgZEXX093Pts7CN9rNiD0nikq7f0vLctVQN5z3NdCygLvFECqE1mxRqkLH2POsHbRiyrMjYlN3w5MpbvzxnTrjHAItqWsU5AgS/C5EyfP2/tWPslRAEwds1iiJudj/ZYcn0rXgWX+kiifKZ00yFFOmcC0jpBk6HIkh/bQhWGDrkmFhuDRyQXdxINLjUX4qXTiHh2KmnQDnPMY00uu/n0okG44oImTGFg5Rc/lUtFna76E8KiShy5Ss5qb0Sn1zL8p9aiHx+qtbNqFrYPjzjOxE/I3udGRqM8qz3Z7jm3UBTEv7yrpKwbvEHJHK+iefAp7mcLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7InJar/qWNocfvyLH6vwbDAH0RSmnc1/tl95Rd2ICg=;
 b=ei7uEWQ1HqfKAUCapZkly+L4H5CscjZp27D+JjlMEQeKpR31m8OGiunrgG5VGikG6BpTSZkzVoinsSk26lBVd8sEBGQDi/lYc2Dr6iyuLWS5xf45EZq8qcGj3lVfmf1wd7/huz92yApd91TUQe6Yh9AaQgL7W0Bm+5F5GbDP/hMyRQjrdfrZ6+WM0k8XySRq2cyMtxvRE/ODG12+gRCRB/m0327cJ4VSdYZFsbQNbOBMpJAwsKwJTcMyqLBkzYd0D4l4T/nnrNbgWtCJuE2RFnVvz4B4pUxlE5qvSban73rQjmW/xUIdKpg0kTo2tFsYVQ1XiCnxNJYxj9j2zDd80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7InJar/qWNocfvyLH6vwbDAH0RSmnc1/tl95Rd2ICg=;
 b=rMuXmxG80AI2StfdNcvM87EbLNrTIs/8ZbZGFzYmmcwsK00nru3Feis4AyGNmBkuc8r7JTjnzWe1dFwvfzLWOI6bP0gDupfqir/uQ3AY/fi+x/slBDvn6V6jB6gqq6s5qusbnu/O6fHbye8Laz3X+zgJVlhMDZyPPn/oJI0iIthA86672mVEnG9fiEpVUHpv9aQmFahcwveJnpFEhtCzi6jYXICHegXVqsXZ5ZFPmDqTfOIJyXVHWD4oEjBXVz8W7Y4EJbg6701Yq7J5XibiMKmcbfCCgkUS3Zzt/rQVZYSl2++QWQFP8RvPb1Lq96kh34haeSz9OOVHUN8LpLvpdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by DU0PR08MB8303.eurprd08.prod.outlook.com (2603:10a6:10:40d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Mon, 31 Aug
 2026 18:46:54 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%6]) with mapi id 15.21.0382.007; Mon, 31 Aug 2026
 18:46:54 +0000
Message-ID: <679db287-3cf2-4d29-b690-d87196402378@genexis.eu>
Date: Mon, 31 Aug 2026 20:46:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
To: Conor Dooley <conor@kernel.org>, Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
 <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
 <20260831-sibling-isolation-3849a5e4845f@spud>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20260831-sibling-isolation-3849a5e4845f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0001A327.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::690) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|DU0PR08MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bdc009-bff8-42d8-e840-08df07903a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|23010399003|376014|56012099006|10067099003|5023799004|11063799006|4143699003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G5ZWeAmflqS46UT4IQkplzHitay0zc6NF6bVbTBHczQy1oTbrTU0TpHL5hkGv57T4L9a6ztBMa0JsJZkw5MOOxg1qCZPWz32rOqOLhoUHiS0ofcoeyaVmDcVRT5uXSH7fLHR+/VMw5b/BRbHuvzLMase2s8lKWkqd+Mdtdg2SN7PUEhv/pw00h8JZA4+dTUItFKMmEx0AB6Tx0769qB1iozPEeEEPmkOYfUjc8763oIbi36Kw9xhUmlLw1abZpuxrkbRUoz3T/DyanAqq1OFlcxXDilZferqd9y8+Of/ew47l7eP9IeM1/KNXLx5G7vkKskqH12OUMjM2QBFxLrrEUI/lz298hNEithREkC+bFtMUJPVf7U63JNJtGynQxCer2CY+1d37MuZo7ToEi/aB6cQBiZV1mvuFjHtOJMPoc31NAAMTGBUuKWpnACBeDVazKFxt9fQYWAQbfForoO3xMhMkKJUAYI2PHuGMVRRHtakc42uhfR0dfzkpsJhbfNdSeRSjXk+mWB+cx6pxt0mNBUXJ/6AVMIUun6HI3eYBzMCUNwI1ZrNS1khP0PybriVl+4rgdDjAyrwDeZ3FRBTMYDbNoIcmbpGQgvpnDjX020=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(23010399003)(376014)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVAxNjAzV1pRYjIyVDVKbm5KY3B0YWZySkw2dGp5KzBlZ1Q5R1dsVXFQTHZQ?=
 =?utf-8?B?VTBDczllMXNmbXg5dk1seHZBM096Ynh0dDE2ZWxNQVNqUmZQUDhXTTJ5dTNx?=
 =?utf-8?B?WDJtUXFhaWtBM1VRZGpKWm1TTTllK1pXTXVVdkQvS2NFTU16MXN2NUJ3b0lK?=
 =?utf-8?B?SkdWdUJZRVlkNU5rMEZzejFZVmVyUXhhci9pbUVQQlZyYzF0VXlTR1BSZ2M3?=
 =?utf-8?B?Ri9QMGt3LzN3WFViNnJxeFBJaGZxVzNxN0hRWU1rZlBVUGpJS0ZGZUNOYTQ0?=
 =?utf-8?B?OS9zNUxtY2lyQVpiNmx2SHJPdE1UUzRuemlhOWdIUTgyQWQxQXZNZTFqUHVz?=
 =?utf-8?B?ZStld0ZNZFJoUitXR0tHNDJrSUVaTFBhNVJqdlFMQ3RvdzF3dnNYYldKalp4?=
 =?utf-8?B?MnlFSlJYUzFZUGZzT2ZZY0thcStTc0FiSGE5bUNjd3pVVzg0bFJFT1dsdGJm?=
 =?utf-8?B?eEJROTMxSEt1MVhEWWl2aUxWWVNwazYxYWF2cStEOE93SjFzeFBvY1JtbFIr?=
 =?utf-8?B?cWxNclgwZGl4VFlMblgxQXdmSXNTMTNqT2tLT296b2V5WkJXV1FiMnJYRXlJ?=
 =?utf-8?B?cmFnVkVJVmpYb0pnd3dWQTBKZXRZRElKUmtlSXA1ZitXVy9MdlhEL3J5MkY1?=
 =?utf-8?B?ZUR6NHQ2LzVhekVhOXc5SHBZa2wxNTlaWFVHV2lQY2wyTngzL0ZRYzhIeDVs?=
 =?utf-8?B?SDV1RWVGSkdVQXNVV3pEWE9vcGNEWEs3V3lBa3Y5b2pmVWViUllVWWpURFhL?=
 =?utf-8?B?ZXpoZnlPY1R3TE1ISG1WMGExOFdFWHRwUjc1WCtZSlYyNlhwbndlaWRJNEpx?=
 =?utf-8?B?NDUzYnp2bDZxVGxMMjBsaGI5SzlaTW1ITzVyYjNXTldIdHc2U1FmNkFZa1VJ?=
 =?utf-8?B?aUw4ekhZdFArbnJvQTIyYjBRQ2JIZjVUTWNxUk9oS0YrdjJ2TEhSRjlBY1kz?=
 =?utf-8?B?aEdlTWJFMHJmTWhMUTBYajdUQVVBU3BKbmh2bUhDTjBHS3JqeGIwMWk2TGlp?=
 =?utf-8?B?cXpwSktUSmhSd0xabVVIcUY2NTlCbGliaDMvSUtmMDhXakRza1JBblYxWERB?=
 =?utf-8?B?RWMvWjN3Nlg2dGhMRVJIRjJjd1k1QjhIcStHRHB5Z2I1cTRXR1hPRFFHb0Ji?=
 =?utf-8?B?c1VGQStuUkh0dzZiNmsxMFgxY0MralF3cFVtVzR1aW83UUo4cTlRdjl0dC9L?=
 =?utf-8?B?Q3ZXKzlaa08xa09KWEFkUzFtMkhuQ1VYOWVCZ1lMWGpOZUkwMXhIZzIyQllQ?=
 =?utf-8?B?MWE0eVRqejB4c2s1anByQWtJOFNRNm1ONzl5RWRpN2hHT3B1NkN6WU9OQ0sx?=
 =?utf-8?B?UmJsZ1VZY2hXNFdzekxxMXhycnkrbmpFcFRob3VmUzhGcmhJSnNLdFZoUElP?=
 =?utf-8?B?S2tud0lXY2U5dlJDN0NwcmRXM2VKOVdhN2FvZFlmQVpQdGNpdC9INUZ1R09B?=
 =?utf-8?B?VVM4MXc1eDZ2eTUvMExVZGJRRThXNXVxMnoxS1UxeEpvSkNyL0JCSFRTcitr?=
 =?utf-8?B?N1V4a3hGVVpydHl3bzVPb1Rqb3lNc3ZZVHVoVkwxb2s1dVh6bkJ4THFsN0Ro?=
 =?utf-8?B?MkRzd1RsZFdJOWJ4V240S3VBdFR3UVhEdXozM3JldTV3ak1vZ1dWQ21oN0tu?=
 =?utf-8?B?d1h5eXZsMldyd2xVL0dMcW9uNHRaTzJleDFFUEFWSlR0NldpRFk3dWtzZlRn?=
 =?utf-8?B?RGtGeENKR2Z0bDVsSUtwczlPRjNiT2RpUWFTQWE0eEdudndXU3YzNDVPNjFk?=
 =?utf-8?B?S1l0SmhHSXE5K2JmQi82cDAzallhc2tmd1JFcGZjaStwRkFQYXJyMUk3dStP?=
 =?utf-8?B?SEpDS08yanAyL0xoOFJoNjJSSnZMWUdHRG4yRWI1RE41bFBCQ25DejZKUWZN?=
 =?utf-8?B?b0ZzYU9ZZ0t0N3dqNHZTWUVwWG9TNlIycnFjT0NUd015eU1kd3hzS1hxRER2?=
 =?utf-8?B?UVV4SkNSSXFhQ3NwNk5nTE0vclNiTUxxL28reUFBSTgwdzl0eW1RY2pLU1Fk?=
 =?utf-8?B?WmJjM2J3TGtuMWZZM2R0cERmUFVrK0prbGE4S2xlc2w5bjhtZkRSa1EyN1Q2?=
 =?utf-8?B?Z3BKV2I2Z0U2alhJWVlsakJ5QmcrOTNWUFNqVW96TklxUnFBK2JSaXhyY1dx?=
 =?utf-8?B?UDZoTTRwaTZaQmkzeklMUldSZFpBOVEzc3BXMmlsY3BnOXBpWkpXUUZNV0g3?=
 =?utf-8?B?QlIyUmQ4STNEWFd5MTJqTUdWdEhLOENCb3VsK2lsekcvWHpGSkY1VWw3ZlRV?=
 =?utf-8?B?UjdsMUYxNnRZR01QdHJLNGo4U3JrQ3ErUVYvTThsS2lNTGw2VUR5WnNJRDhO?=
 =?utf-8?B?QWNoY2xVaFFGd2tpZHd6ZXV2a2dZOG9GNnNWcFlDaUp5RlVJaGVVV3paV2pN?=
 =?utf-8?Q?iVh7GIvzx7kiZsQM=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bdc009-bff8-42d8-e840-08df07903a2e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:46:54.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9e/8cK3qiBxLd3LsqCjrYS00UKqZkDDh0ugSSMvWfjPYQkc68FyU+nWtWPBFMm2mWwvjIyW8BERyW4vq/4cYMZNq9qMIRyMFuxvC8jl1Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8303

On 31/08/2026 18:57, Conor Dooley wrote:
> On Sat, Aug 29, 2026 at 03:47:00PM +0400, Ahmed Naseef wrote:
>> On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
>>> On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
>>>> Add the binding for the pin controller found on the EcoNet EN7528 MIPS
>>>> SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
>>>> pin configuration registers have a different layout, so it gets its own
>>>> compatible.
>>>>
>>>> The CHIP SCU holding those registers is referenced by the airoha,chip-scu
>>>> phandle.
>>>>
>>>> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
>>>> ---
>>>>   .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
>>>>   1 file changed, 190 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
>>>> new file mode 100644
>>>> index 000000000000..3ce1a5309d09
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
>>>> @@ -0,0 +1,190 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: EcoNet EN7528 Pin Controller
>>>> +
>>>> +maintainers:
>>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>>> +
>>>> +description:
>>>> +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
>>>> +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
>>>> +  registers have a different layout.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: econet,en7528-pinctrl
>>>> +
>>>> +  airoha,chip-scu:
>>>> +    description: phandle to the chip SCU syscon
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  gpio-controller: true
>>>> +
>>>> +  '#gpio-cells':
>>>> +    const: 2
>>>> +
>>>> +  gpio-ranges:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupt-controller: true
>>>> +
>>>> +  '#interrupt-cells':
>>>> +    const: 2
>>>> +
>>>> +patternProperties:
>>>> +  '-pins$':
>>>> +    type: object
>>>> +
>>>> +    patternProperties:
>>>> +      '^mux(-|$)':
>>>> +        type: object
>>>> +
>>>> +        description:
>>>> +          pinmux configuration nodes.
>>>> +
>>>> +        $ref: /schemas/pinctrl/pinmux-node.yaml
>>>> +
>>>> +        properties:
>>>> +          function:
>>>> +            description:
>>>> +              A string containing the name of the function to mux to the group.
>>>> +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
>>>> +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
>>>> +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
>>>> +
>>>> +          groups:
>>>> +            description:
>>>> +              An array of strings. Each string contains the name of a group.
>>>> +            items:
>>>> +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
>>>> +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
>>>> +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
>>>> +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
>>>> +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
>>>> +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
>>>> +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
>>>> +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
>>>> +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
>>>> +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
>>>> +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
>>>> +                     pcie_reset0, pcie_reset1]
>>>> +
>>>> +        required:
>>>> +          - function
>>>> +          - groups
>>>> +
>>>> +        additionalProperties: false
>>>> +
>>>> +      '^conf(-|$)':
>>>
>>> Why is this needed? Why can you not tell from the group which pins the
>>> config applies to?
>>
>> Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
>> group at all.
> 
> Why's that? Are they just fixed output pins?
> 
>> The spi_cs0/clk/mosi/miso pads are only in pnand, which is
>> 17 pins wide, so no group names them individually either.
> 
> That's easily resolved by breaking up pnand though.
> 
> Devils advocate thing here might be to say that the dedicated
> configuration node should only be for the things that are fixed outputs,
> and the muxable ones should get their config from a combined
> pinmux/pincfg node. Personally I think that presents a nicer interface,
> where someone doesn't have to go figure out what pins are in the group
> they just assigned a function to to also set the config properties for
> it.
> 
> Cheers,
> Conor.
> 
Hi, I dont fully understand the exact implications but there are at 
least 2 more Econet pinctrl drivers coming. I would prefer it if we 
could keep them looking exactly like the other Airoha drivers that are 
already merged. All the SoCs share the same structure and logic just 
different pins and addresses.

MvH
Benjamin Larsson
