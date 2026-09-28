Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013047.outbound.protection.outlook.com [52.103.14.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E348BD54;
	Mon, 28 Sep 2026 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587273; cv=fail; b=FZxK7srYHKse6PYh/R/fAlw0jqkYI5UQbBGtwLSCT5Ggza59KTa16cG7Mfg9vGUIXLtfeKPLXhJXfLrL9/RqoDBmeJMVzMf4ti/H9lLuLV5pKBLuesakB75zu8Jl0HnpD/mOZVFItBAUN5Xit15ErYDDuYfvJOU+sHOKHkkCYD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587273; c=relaxed/simple;
	bh=PhU42GWv56o/jTSd9o2M/i9uVTUUVl/+bmZKHiZe5OM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JQqQ/JhIFyAprEK3DMDupbHjCnRS9ablAHQAy7dfkt1i61Px/38rXkrBfCLEszwEh7/Z9ic2aeQ7gJ4eG5AMz4bjGYDFGwKJfC/hXsGefRyCGDK96sXL5bSU3B5uBVfC858Trktgd/swqVwG0LUK7+AFzKH4eBGncpeVsdQ0W0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CpKqTGZX; arc=fail smtp.client-ip=52.103.14.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CpKqTGZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4IeKwLhlerfJ805v3+qPZFpRyrMULQ5P6dleSvz5slhJAjIRDFMoqikne0S7PsZpgRthwwwzhDLoqUg4e12E+jRqob0nKq3xkYk/Pc3PhcyL9FuRe0eZ9++GsetP6dbI0UsKYiPZPBUV2C4tH4Xh5Z+pdZA5poKz7L7fqC7bqznvPhL5M+FpierFsMiRFk7ScF1ykyVDVFD1u9LtkyIWS/scREiO+iv9SNWs/btsJqDaQCP63AN8+4XygfAP9hEFxllxbOFBjR24pS+e3qXcOx2bxlB1u6H1omXd+ti2AnPl2nMKen7nB5P6kQuphOy9eMKemkpIyWj0hDyB2vfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeTp3irpnMpR9u/PrS8lM2+ytvninayISOTJXbKsRNw=;
 b=FjkZ/e1zbrNrOVOoIQAGkAASR4ALKsjnVYjBQEKhuJDTspUtT+iZsX5fhKdWZuHpWFhWgcj3Rm2GUdQ0C7aoLrY3ZhYPXzBXm8aE1Ly7HzDU6qxIMkWbVN7cmQ/Xhv0joN125je4al55lWxtf6lMh+ciPMzxIfxrOgDUU3GlyRyn3OBoNWc2SVB5HH81vW+GjJy7cpXLig3TN2wy/6PKh8EMWlEo3EPRAzJiUPeGl8kSQbvDBkJkl3uuUMYLppANwp19grtfeiD5KcZwcXWvESSReDBcg+DWXWIFe8H49XsFg/vJ1JaE6ZI6wT7swGlMltOk03EH5u4CV5tngDJMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeTp3irpnMpR9u/PrS8lM2+ytvninayISOTJXbKsRNw=;
 b=CpKqTGZXMXrVAjlHCgsBliYRbUR7dKiDrMY2QhIAQAXnDu3m4IilcRbJ6gsr2DeHDocFpJCb8S3cOvSc75y8X7/fFotIOSoPS+nu2aukO+UB6g0ihLd9Xa6ZaMhBIhlh7oW4/1FFJvCoYkdYMzXJwG41mIByiB9k4sFaln6Vdu8DbFOEI16K5Vt6fapdKM17RzhG//+9pknNuiuauYripa0AGjwQFMrEn6ye348RP4+mESUl73BcT05gf0a1nmkkynADYC7J+03VIPBd9TgCH3Z45AhKYStL7S0qwJPIHOOEr+pr3i1/EyJ8vHPITd85EMWdlANfelqh166evjoC/A==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SA3PR19MB9669.namprd19.prod.outlook.com (2603:10b6:806:495::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:21:10 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:21:10 +0000
Message-ID:
 <SN7PR19MB6736ED23216C576674720A5D9D8D2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Mon, 28 Sep 2026 13:21:04 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add required gpios and missing
 PWM functions
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: George Moussalem via B4 Relay
 <devnull+george.moussalem.outlook.com@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linusw@kernel.org>
References: <20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com>
 <CAMRc=MeJcYezVbqVq4cM2RuAtP3mxCuKKLMS3z+XqyS4DEa5qA@mail.gmail.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <CAMRc=MeJcYezVbqVq4cM2RuAtP3mxCuKKLMS3z+XqyS4DEa5qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <3fe6addf-dd4f-409f-b181-b69917ef37d4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SA3PR19MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 384c8fa2-1aaf-41b1-76a3-08df1d41d537
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|4140399003|25010399006|23021999003|21061999006|15080799012|5072599009|19110799012|37011999003|6090799003|8060799015|40105399003|52005399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ei9KeExqRkEvaHdVUVQwVzVsNklsZWNZQlNIcVpwRXo5KzV1aXA5YmFxcGtH?=
 =?utf-8?B?akU2OHJIenh4aGVNakdVZVJ0b0kwL2JGc21vUUpndWVNeDFlaFBHdE5VM1J5?=
 =?utf-8?B?eE0zWnVCQ1lJVmhialBoQ0JadGxHQTVQekk0U0ljUVBFSHNsUVA2TjJaN0E3?=
 =?utf-8?B?QjRHT08wUEFUMEJyUDRZS0hDN2VTQ0JYbDBBRktCN0UyMzNhdUtWcGtZRmVt?=
 =?utf-8?B?VGVvNmxBYVZTYlR4b1c3aTUzTGdRemlGYk14dzlNWURabTZLOC9qK1p2MVc4?=
 =?utf-8?B?eHAxOGlsT1psMUF2NHlLa0dBdzRLT1BEcE40WG1vMVdjOFBzUGVRcXNRbE81?=
 =?utf-8?B?WFNoS002VGIwQU5NYVhsQm81SDc4eCtveGFsSVVRdTFiUGpSZVArN1JaTElZ?=
 =?utf-8?B?YkFDelhqeGlKMlk0QzJRVUUyWkNldFFRaEw2ZGZRSjVINTdSUzM5RW15Y200?=
 =?utf-8?B?aktRQmgrZFdMUGRsZkQvOGkvdkRaVzcxalJNblJtSWR4YTlYVU9NNEpwaDNj?=
 =?utf-8?B?anZTTllaWVk2NVZOVExQcUI0RmoxNDJsaVp2MnUwODQ4ekhwUExwMDNtZDcz?=
 =?utf-8?B?MGtXZDFOSHdGUUQzMGFCR2wyRjhQdmZzVlh6bFNQaWZSQVk2d3ozUlBJeklu?=
 =?utf-8?B?OGRMNEhkMEg3cHZvUmlKZkh0dGsrSU5wNFJackRPS0tjTG9Fb2hJVzVSSGtG?=
 =?utf-8?B?aUtyMDMxVGdHUHFTekxrTUgzQ2hVUG00OVF0QUNKMFJ5eVFMMEpSK1VWdVRj?=
 =?utf-8?B?d3lqQXVJalZMSXdQNWQyS3ZQWVN4dHpXRE9oQWZXRTFiQXo4ZElJMy9OTzds?=
 =?utf-8?B?UTRBUXQ0SEZ6YnYwbVpNdmpVeXhNNFBPcndMZnIwNjJFUFp0M0RTMEVxQWdq?=
 =?utf-8?B?dTAyWEwvN1FDK2RKZ2RyWEliTk1EQXN5MWhjVytkb1JaZGtpMXdIa003S2g1?=
 =?utf-8?B?TWVLamoranYzWjA0Zy92VHVRSjMrM1JNbHNRb3I1OFY2SkdUVGsrU1Y4aUdY?=
 =?utf-8?B?c1h6M1A3Z2w3SFZ3TXJMUHBSdzVuajZoZ1RucytrVzJ1eEZVdnBScG5va2xm?=
 =?utf-8?B?di9sTDlNc3R6Wnc1WHFFeHdpV0tvWW1aRUd2OG11T0xhQjhqbGJOeENTaldC?=
 =?utf-8?B?UGw1cG43RldneXM0a0tYMWhwS2VWenJjWGZMdEpkTGhBVGpjSlVCNkhuK2Jx?=
 =?utf-8?B?K210eWltSnZ4UjVVcGl5ZUV5YWdMaUppZ0dqekYyWnBRSmxRbk1vSk5XanBj?=
 =?utf-8?B?MWc3czgzd0tMdkZVeFRuMkdYQ2R1Skg3bTJhYUR1Mi9YV3F2dUtqZjE1ZXZN?=
 =?utf-8?B?WmpuU3AybmZNMHdqdEJNVjA4cnJkbEFmSUlEY2ZLdDkzck50WnlndnZGK1c5?=
 =?utf-8?Q?Ags5wfA9V9pSuBAiQzjChVPWcNgqP8Uo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk1mQlEzUGpvc01RbjBZYkY2dFpZcDlxaWllWlNNTW9WT21JWDB0NkFYM0dL?=
 =?utf-8?B?czUrR09mQXgvb1ZQMEhlUklJUy9HUzcwMkoyenJWZkQ5UWdxY3dVMm53WmFL?=
 =?utf-8?B?ODh6T2FqSVpkcXNzV0pUVHdIUFcxV0hIUU1YbmdjdlRCOEsrZjd3d0Vkc2Nm?=
 =?utf-8?B?R0ZsTGVrcC9HakhGMGs2SWtTdFIxbnpBTmJhdVEwczJpekRmekhvYzRNalQ1?=
 =?utf-8?B?czdYbTdMNU44TXNmOFdnL01WSUxkOVl6M0wyQlhTWGEvTHZBWmpZS1BGTUdt?=
 =?utf-8?B?V3RTNWxTWVdCWlliWmIvZDRhOWJmSkpMclU3Nnpka3MzTEcrbkwvQXpuS0t0?=
 =?utf-8?B?Nm5HSklWV0V0RmpCb016cWk0VFVnTUR2YXk5cFlTajRBVVBhaU4zZll1RVQ2?=
 =?utf-8?B?WSs0bmpiazIxZ3JmTHhuaFZ3bllRRklodWl5c1M5UXZtRTlMYnZPeFR6SkNt?=
 =?utf-8?B?enF1VWxLZGZhUzQ5SVlEejRwMXkveW5jYm50YXFHS3lkcHlXL2l1YU4zTlB3?=
 =?utf-8?B?MFN4dzdCZmd5TUIxTnEwZUtBM2FVT1FLcTlZUzNydkFnYnVuc1VRQzA2SlF4?=
 =?utf-8?B?M3M1ZFhJODBiU2JxQ1haaUZTUVRqMmp6WlMrVEs0NFYwZktNc2dPNitQUXgw?=
 =?utf-8?B?cUpEQk90aFJFbWlFaTd4WkRZaHVoQytyRVVhdWRlM2NUSndUbEZRc0NoOHFx?=
 =?utf-8?B?SmxzS3Fzeld0QjZCTmNPZlFCbjZHOTVEQ3lCK0t2aUtFS1RBNmRhK1ZjQjRu?=
 =?utf-8?B?QVlnVW43S3lxSVVid29TZ2pyS21Qb0xrNGhUUGsvalJtODNkSisyTWRpUnRj?=
 =?utf-8?B?THU1NXFGNjhjVXlDMXJ3UFRJekVuL3MrbEFZamx0bFpuY1pvL2ZpcldlSm4r?=
 =?utf-8?B?MFZYNXJ0RUpySWc3Zk5MUVNMVk1FL0I4NCsrU2NCZUEzVDNURnY2bWhwbUdo?=
 =?utf-8?B?OFFrU28rWlgyc014M3ByYlFIUlhhTWY0ZVlqR0hLQmc1Zk02SWVpTEdGcno1?=
 =?utf-8?B?VnJTU241bW9zOHBOSFZRd0drT2RIMDV5VHdaa1daR08wVEtqNDh4NjhxeDFw?=
 =?utf-8?B?TnozVkJNMkptampNcm9LK1o3ZlBCamVXYWJpK3ZBMjdydVpVTnJWOC8ycUVl?=
 =?utf-8?B?ay91dFZJZGYwU2ZoeFdSeGJyTG1KdFVyYlVKaWg2ZkF1VjR1RlB2UGV5NnNn?=
 =?utf-8?B?LzBQZ05SOW4rQ3dRdWxEeXcvNEtkQXN6M0l3eEM1QnM2ckNYRFFHRlRFRTRy?=
 =?utf-8?B?UnZ3MnIwYkowMndUMjZ5dDRLNVFuL2xwSThpOUFMS0s3THJWSW5uaklQQjFq?=
 =?utf-8?B?Z1V2VUFzaDNkWDVWSGI4K0VFTnpZcjNhN05wcGNjNU11N25rdmtYakg2a04z?=
 =?utf-8?B?ZGt2cjRiWHZjQ01vZWlScEFVRmVVcU1tL3B1d2p3QzFBc0Z6ald5ZXo3MGh3?=
 =?utf-8?B?bmpIZXlsQTE3VXZBWFZmanJySEFWYnhOdG5KQ0ROYWJiUTNIWEw0bWRtSFh2?=
 =?utf-8?B?TnNQRmEvdjVRSFNmK1RWWFFnMGJGQTkxZ0o5cGREdGlkSmxyNDBwVWl2dUdk?=
 =?utf-8?B?QWlWZ1h6d1J0V0ZPUUQ1bTJ2blNtUXNrUGVkbkpsWXYrazgwUndZYytxdWwr?=
 =?utf-8?B?MGxMV1MyVUF3ZXloSEdDaFhTckdjN3JmZ2c2RlJ4SGVCL2pKWVpqcmsvSXFR?=
 =?utf-8?B?cUNSS1R0WjBQV29tU0wwMFk5QkJ6U0JmUXR4TFdJWXA4bU5SeFpqR0J2dEpm?=
 =?utf-8?B?YWZNYXBnNndzRzQ2MlFIQzA5bENEb1BzL2N1RWJYSDQxR3F6cG5rQnpqN1hw?=
 =?utf-8?B?dVFya2NtNU5DYVo4WXZtL2dkMkcwVk0zYk9XSUlCT3JhR3djYkcxSEIyVVpO?=
 =?utf-8?B?S1ZCQnd6Slp2bFh3aWsvRHkwT2pRUURuTGpEWEJjMVp4OUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384c8fa2-1aaf-41b1-76a3-08df1d41d537
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:21:10.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9669

On 9/28/26 12:38, Bartosz Golaszewski wrote:
> On Thu, 24 Sep 2026 14:22:11 +0200, George Moussalem via B4 Relay
> <devnull+george.moussalem.outlook.com@kernel.org> said:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> On multiple Linksys routers, GPIO 1, 30, and 46 are used to drive the
>> PWM led on PWM1, PWM3, and PWM0 channels respectively, so let's update
>> the pwm# and pingroups accordingly.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> Are we *updating* or *adding missing*? Depending on the answer, this can be
> interpreted as a fix that should be backported or a new feature that should
> be queued for v7.4.

Not all IPQ5018 routers have these GPIOs assigned to these PWM groups so
I suppose it's not a fix but rather an update. I'll send v2 out shortly
with an updated commit title.

> 
> If this is a fix, can you add a Fixes tag?
> 
> Bart

George
