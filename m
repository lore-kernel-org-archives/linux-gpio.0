Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793840314;
	b=Gk8GBJsMV3AQGYQnTyZXJwzymQZhqbAq8au3gVpDbFaCGOqGNem1K+wFJzS5xgQlD9yU
	 FoMOf7qtXFRC6FnN1RW81/zrdKtd3RoZrL6lVQ/A6YUkvQJ3cWchrJOpTvOG+MfqBgZIY
	 R398l6Vp5nM8t5UALdVmM2gRTycCHfO7p/wIt2eH4D2Al93kQnx74YaE8v9Rco3hp4H2i
	 J8RND368xq0BkMv3L3h5gIK4lFohkMMyhP4DbYowawRuEnf0sLwHZ7227yGowjrlGPjYD
	 1pak6G9y/yvqJeI8MPhNGjj32YAH/OjYQ1agrrRuoJxMJvhPhdf0sURdNz4BebP/ZZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840314;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QEL6lJ1kv5I2oa7aap4eazq3X8qIHZIcB5Q1SYZQTa0=;
	b=FtOimfLiN63siK6gKIts6eiznjEy6NhDhHHB0imrD7MNiTaa3lMyRwpmqtm3hNA4Reh0
	 Tb0hHqN5odVVU3N+93NEqSP8XJvsidUm3gy9/ZqLzKo4ZscPgQLAu6H1v9oyNAZ9MuiAS
	 HjfusZwO8FHlvIgQojqacdga80M7mLd2kn7gVFfcMqHiXhgf4q/R4LlgdzOZXUAMu0ucw
	 vEZd6gq0ej+wToBv57n5bpT/DHpq9z2sdlvuskhHWYQ1qqyo3u52IYCrjdRBwh0zQn3z/
	 VeuS1gThPqpweTQqWwCN4SNoTG0scrHx5OpMQzo+NovMA19gbzh7FBGly2tPWM09Vyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.137
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2137.outbound.protection.partner.outlook.cn [139.219.17.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB6606A31B;
	Thu,  5 Nov 2026 00:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEB6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTVLR8pD0xMVwV4RqFJubswB6EzXY4oNaMkwjggryt9E0g4s07UG8lii3I/QJYB9+vwmi4nvVntcy9ebuDpaYv21inmhtEJVkwkZY+nvjYE1Du2uSUE/IF6DaIQa4dweFV1opTStrWIFgeUlojZHZa2s00SKTdJanS9sn21xjTuBPPeV/1QsU0hVAhlfl2P92sZHxeeCeowYwd4jcU5GVsXzJaUVexr14MCyJ7cQjReo4RbJI65f+IJkE+VszhuPGfQMG42kTYd/upO1I2fNX5UDYUHXEXhpHfq56gHAG3Sa70gXdIc4b2qcHgYyWQ7NShF+28WGvpfKJ5okKdxuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEL6lJ1kv5I2oa7aap4eazq3X8qIHZIcB5Q1SYZQTa0=;
 b=jVIHcMz4eGAervL0PaI3TXArdyH2nGQ6lR0Ag1gNeiXWsBcw1Yz2YYOyRfEn0o8gio5zHBwZzEMxkfk0peT6RYwudBdyS7+OQ1S/Pt2SsKY8geCHjXrGnxFVBhpMIs0Jawib/hfZgdcB+ldMlygtvsplv2D67Ug/+YdUnPRT+IzmqyAN4NUX1kd8NsP0k8pCZqz1kYdkn/O52BqS/Vv7zF+Qxn5+aw9AYHW0tFUi64ADn1oSWYA75RF5GvvfFYX+tjtr43Nn4IuTzPvOa7GxotIdyvSak79HEMJlTKM5c7QI6PXq40txOZ7voII9JVFlT7Fq5Pf8GDy4nJCjFqpdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1297.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 00:58:21 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0592.009; Thu, 5 Nov 2026 00:58:21 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Aryan Sinha <sinha.aryan03@gmail.com>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
CC: Linus Walleij <linusw@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: starfive: jhb100: use str_enable_disable()
Thread-Topic: [PATCH] pinctrl: starfive: jhb100: use str_enable_disable()
Thread-Index: AQHdbG0+zSZcZnXmbkaKUhY4K9lT7LceqKQw
Date: Thu, 5 Nov 2026 00:58:20 +0000
Message-ID:
 <ZQ4PR01MB1202252CF84905A8523F832FF2772@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261104150013.32879-1-sinha.aryan03@gmail.com>
In-Reply-To: <20261104150013.32879-1-sinha.aryan03@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1297:EE_
x-ms-office365-filtering-correlation-id: 09275a9c-5385-4e49-cdf2-08df3ad7e2f1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|3023799007|261022105027099003|261028144727099003|261026140227099003|56012099006|261021121427099003|261021123027099003|261102123227099003|261009223027099003|38070700021;
x-microsoft-antispam-message-info:
 HueRbsGclH8i62IQjaGZtAa/9Ss+m3YLP80pcDZUb/VVHCSUUrprDdErU+1D9mF79AqzqetshDtFhSd4OA8J50+BwQiV3JwVQKLkz5zwF1y3L0q/95cVeSDTTxqkn1A0oHVkIqzGntMI2koaqjjf6j3VHB6fwBzBHEIacHdEzHWVAmzMUkgPtGt5CqepYpfYNE2n/HW+NR/Kz4q/gp7FQoZtwHG2Bnmo93SxpvzAJXEgZiHAoAtFKUCiWeL+Aw57BZjEK5Bj4fPYmms3xD+lNqZk7jyk4UJQ7qxI4Eynq7S6JlSc0kCWu1+Hcq1lPe1fnTu6uZfff1y3k2LFFLvIfsoMsRyz4Wg9NKGIXFn4pX4eiduPmK/uLo0J4htF9GhZtg8lsoc4Vh96YU0ZjKbpbAno1YcioSdBEX4v1MmBgsk3OPse35EsoD+ftLrjOSKv0WlBatyiMHWzDdkHStU7VmexdAK547YgRIXG0+OXstzqNNRyJDmE8/asBNg3cGe+ixcMHp0o7/N2WapoZOoRNVAkN8X+FvelyOgsfZ+UAnprJxPCwYkGN69dfvHYgzVY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(261022105027099003)(261028144727099003)(261026140227099003)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MakST86QaTbYsbWOhDj+MhLgnlACgdem5Cv6Sn30jfX9yXhDMw9eMFM9wdPz?=
 =?us-ascii?Q?JBYHln32CA7eA0xoEUDrNyibGQFMx6fSmdLF52dGJ3wKAWTLsjcf4gZuVbRb?=
 =?us-ascii?Q?oPqDjwCkCFdibGarllUqVOmIPW4mCmvSMv0JFYS0W0YsEBM1LNW2DW2eceKG?=
 =?us-ascii?Q?Cmj6nW7Fpf5ZJwEBEuBbwG1/Ig2rDYeywbDZZ61fcUNc2un/MBoBeEU2h/rM?=
 =?us-ascii?Q?ePqrMDRjZSyY81Ofnyf+krG49J7Sd6ceXSYQqUdz4e58W23EfVs/ZWY42DjV?=
 =?us-ascii?Q?YGgqnnqG7yh3z4Y7GCNHchYmlk+nJALrq/7cly3JQqwZV3Z/becJRIGLjJ31?=
 =?us-ascii?Q?yeAfEzd/MQto1r2Xk7oAt24YvX9bgzcn/ATWyOcYYWbQS77aBWWrECU3TvAV?=
 =?us-ascii?Q?ZMQVhcoxKpvpGU9rlHNMQtu4ePnNoIvzu2jwgvJvmAc1EDOdpKNoWdBf4ZgR?=
 =?us-ascii?Q?/R6XaUFBAeWxPHkiPziX/suXtyGZyy4LuZivuziu383B4q+zd6BCeQg2nt+g?=
 =?us-ascii?Q?s9RpouCFrprM2vGrk3pd6vvV1BImzubRT2AVzfJqZ2w1XAMIyfTENMF4ABI+?=
 =?us-ascii?Q?J8ZP7oeGn+mlSAPvbIZIGNzxEl8ZbW2Z/8qp4vcNkGZa50cUPWxb0PS0Jvst?=
 =?us-ascii?Q?Rs6lgrKPpJh4z3hU3WvaAYQRZRA5HvQulE2rgnhcmJlUyBwYcpUUk2++T74G?=
 =?us-ascii?Q?eUPkfTJv1X6c4P4MDeJIV7+79T3hcDpRfxoF7Ek24B6034PLMHE8TNVUPTz8?=
 =?us-ascii?Q?ZcGiNRG8Tn8vSK7MysFSDreTajGmaWqrkULT07ZwQj49wK5iAe5SsxcAcm70?=
 =?us-ascii?Q?vT236U3e41CYrSWRcctyk07FgZyB7YTp5Hs6E8ogu+q/tlFmLV8DjeVJ2wAZ?=
 =?us-ascii?Q?FlswvMMHlTWhNo0Bg25GYCIJqX55H4yqDXN/jI90hbRrvai9QNKLlzFl6kNv?=
 =?us-ascii?Q?9CQdkpo/CLDc77wjCmyODqFMB/uACA+ckYFK6X1EnIdes2qiQebR0QOlM+ts?=
 =?us-ascii?Q?fZ41kqG4z6A2FpayWWj8pR6mCEasVr+fEbL+VkEEtAfuiYCohAZ/cyZM5CFR?=
 =?us-ascii?Q?r+La1kDgKtQUcUhJDHt3NDswE8h4HG0yZNkrninZ3RI3Cjw/9b9vNSrYh5Bv?=
 =?us-ascii?Q?9tmf0N4zesNs1+lw7GlAYmKiowLkvsRPGfyrbxxANsPsAFmvVgEjgOWDfwWj?=
 =?us-ascii?Q?WntTTsU892dKaCEfXeYUwQN0xAmVmRs6wBky25+/md+0Tq71sTtKOKLyhCmk?=
 =?us-ascii?Q?t54iKJklHxm9ZN8mRedKyJAErKPwPAFbQDAVCn/GNe6HYA27Kzn9GAvkqhGi?=
 =?us-ascii?Q?h7HmKj/fQTcfMroBJoe7Nwq3DTVPI58uocENofLpQi3oGS5MntxSx0dW7vO3?=
 =?us-ascii?Q?lzkZx81PaA6aZLbDw0I1JlUi5uF7y07trFRsmjRSDSbYUWwPrgMXxmrkCS/j?=
 =?us-ascii?Q?ALvC4UA+taTT7R7Nk7kL2xfMTQsrxpMjpLVJu77mz73KFomxPkAAg+cV4j+0?=
 =?us-ascii?Q?o5EStrsojMs0rik7LWqL/j6xqb+prRB8Hr5JZ64sM4J8VKvKKf1eHtFpF0uX?=
 =?us-ascii?Q?qGTVEcvqPymUrO5VM8lEI81b6uqQsn49Ip7cdr4jviknO3GbZ5UoFg/WHDjG?=
 =?us-ascii?Q?HP+PoJMxcX1tyd2ly3+I3nNtfREKwodJ9ad4SUzssEyHooPFAdCUdruNXo4a?=
 =?us-ascii?Q?1pBaJ5e2Ny9n93qNcc6SOB9CqlanhDCQd0Xx/lTioM1der1gGRDUbfyWFXNV?=
 =?us-ascii?Q?EzmOqzfpX+1xB7iovNJXSMyJCkrQDb8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 09275a9c-5385-4e49-cdf2-08df3ad7e2f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 00:58:20.9595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDhEQ1ZkTZaVYzL+R1h7gZlaXQam/KKoOB7GP3ulsVgzqb97hINBjmcZXGgJQeb1ycAVLJSiYGEfXMzoywHqSdJD/TUcrK9R+jnIgUhyav1L/2r7jcTBB/QswYu0aGuJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1297


> Replace the open coded ternary in the jhb100_irq_set_wake() function with
> the helper from string_choices.h. Gives same output.
>=20
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Best Regards,
Changhuang

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> index 462a26697..329153876 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> @@ -20,6 +20,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>=20
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -1152,7 +1153,7 @@ static int jhb100_irq_set_wake(struct irq_data *d,
> unsigned int enable)
>  		ret =3D disable_irq_wake(sfp->irq);
>  	if (ret)
>  		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
> -			enable ? "enable" : "disable");
> +			str_enable_disable(enable));
>=20
>  	return ret;
>  }
> --
> 2.46.0

