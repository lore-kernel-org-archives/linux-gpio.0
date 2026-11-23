Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443733;
	b=ytMLmc0mqPJCo1uGJvozjZTV38+/m1Koi7kjy8oHuUnVb6ZoJaG9Ak08T09JHiMngQjq
	 xt+E0OooCw/VMARWMO04dPWYdFeJrV+jNraYi2RRQ5mV+SW5astPK7VTUNa08NsOg/E8y
	 PjsnEyVwyg80LWavDHzrpFAXUFXJ5qDUhasMMeMiT9CV4anW30LTOlmVzJp5VKV2+kifZ
	 RO28KH5E+30xC0AMVEUW0jPFyycs8ldKZqxqAEBMAwZVSMZlUP2dGEtnzDP0EPPeQMjHi
	 ydGu6lDx5koxXBTiF+QBAH3gN5/7I1liUCQE2eoQQmlKfjdF/D2S3F+k8XlJGvEkhOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443733;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=E6EcGP0g5aDe2xVZzR5PQbb8o2W9NX5ex03pgfOiluQ=;
	b=KtOx7qUFn1RM8wvBBBdI7nNmvQ0rxHALBnkf3TKvoYrMwB3JtWWAYc0cG7sgg1jAUJyg
	 tmuVeCPvBs2JtYLrugreJInCR0m6nTMqO01CeynkezD/8Iic6riZc7QT9p8CeYxJV10L0
	 RVwsk0/CL3+r6N3OKwHJ847pbV36M6okyzcx/CiWKLU7+LIJsEsT3g/gfQWqZ1rY+tV/G
	 v8ds2rPJoW3u7d8dTc7JrB/DUDSJBQsYurkB3XC7sWB7iALvHs5dYOQHmfiD4tUUjrpW/
	 3wF9bl7orb82AoP492ZJDEbp2Q43CO9SWCKAuK5RnvwaCBekjCsdgxO300s7ENGHvHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=erEPSj3q;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81B606A31F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B81B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=erEPSj3q
DKIM2-Signature:  i=1; m=1; t=1795443730;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
 d=web.de;
 s=s29768273:rsa-sha256:o7wgTcUscprFxIBpexG0o/AxwTBk
   VS/bSnDXmw+xw0kn2hUMkPdN+1ESvm8rJSunhSNPn6P2YL0C9eVK3mnabjGM6o0gUCtu1BddfX8
   4omv/RZAb4xH4IEx6n0f5Nqz7+5u8jy7MDtxkm61rn2EOkfjsM74R6nB4o/sKiduFmNl6kGOmhX
   dKgIboXyTvIH4U3n1m4cCCkyEBw/R5h41Gq+A20Sk8jTSoJ4X5O12VBcH3fXfroj3hA6kmLx/x+
   7OzehvFitsS8v8/8bVGBzzHSXKdVAzrcFeSgHT1sBpW+2WAv49S59HrdwzKlk+jwZV1VBkqBw6O
   pQmUUDBIbcBkjA==;
Message-Instance:  m=1;
 h=sha256:
   IhC4nQE+eQVEpJMUBxNOv5HbKLpMsuaJxOLLybFWgys=:
   DFSpN2M5HWPAbM36phKlLYOVY1b/RLhca89mMGQBnFU=,
  sha512:
   CFrqmdkaXLyC0fiyuxeJywz5w6r0hrolZJ5r7DNQftCuRb7NUA8YbOLi8b1abLsvWEUfrqATFa1tioAUnn8Uvw==:
   AA6vZL4otkIbvCJoQDNHrWqWLAxSfC5TNbGuhYnxlBpzFzugQFqGVFJcUxnDaYGfiY3OFVZbS0RFQ1dPiMbqQw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795443721; x=1796048521; i=markus.elfring@web.de;
	bh=E6EcGP0g5aDe2xVZzR5PQbb8o2W9NX5ex03pgfOiluQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=erEPSj3qB6Yf+FkBWrOd8+SYxMXSjKZkttrWkBz/naJDuSKkPGL2ALg6KVPBGZii
	 zRlp0TV5sf+1kkLlvx+asExSZau3f2FLgybRtM3YWhXV/h8VduJv5fvZd64iYPPpW
	 6JdiZA67r7EI5Z2ZFe8PUnGiW9v0YNeYadf1NRx2FMyAdif2xj2xaVE1/Kfi8n3XG
	 jJOgokAXyYSH8iE3tq2+E8VX7SJi3X9gb/I7nP8M8HsLblUJnedvlgz5JNjbdZhPj
	 K6AH7wV8XeUQNcgbD3Pu4u1NzqdqqCdqWpgHBBXMGr+cFjBMq8TJz/Sfj7wc04W5+
	 wEde7FjCfYlSy/enZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgRMB-1yBALH4BVH-00gDTK; Mon, 23
 Nov 2026 15:22:01 +0100
Message-ID: <02632c0d-110f-4d42-82f8-30091468aa91@web.de>
Date: Mon, 23 Nov 2026 15:21:57 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Linus Walleij <linusw@kernel.org>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v2] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8iCeC20XACnUGlSKzAREyOxGil5LYjauJzWEKH9QYFDWF8v6dYj
 kbN0W26P44dUVLxlxtKGZ/m9zXzGS4DjYAJj/gpHokTdb+xAF3GyLZzLd6APPaIDbxUJg4o
 XzHnqZTA7nNPsVQIH/AQ8xas1WScM5x6wRl7YnR7g8AfHCmFo7NSYKUCwVZQNjAL4VS+MMH
 NSnHAwTnLGHospKi8MMyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z8OEi0ryZwU=;h3xtCygA0RiLD7VO6e3kjlIDArb
 M4GEV+PriBjmocZGaSWO254y/xTMq7NIGYgOr815pC8a59p8QXUpzwFW+XQizwvaI88XEf1Yq
 Cfj7hAPJ7S9htBioeSNZYXOvEErMOatY42XTOeiLEnD6v3SxvbqJVQm8QT88Hsa2fpXAivOF/
 aYU9PbxCivz8NJk/k54ma3K8AIAH6Vs5mYazw/tyRUVvrQAOWEG792dzJ+em9VNxxo/H+R7p7
 9HtpdLoGEfH1ZBU1j0N+pmhjoqqN9hlUL+4Fq+3Mihs/QmFUWcwxs3tR0miGCq+oPRd0Rudx2
 NIyAg2HPWxCf5TQAXCIAt07Nh6IUvdqvP4IYGnO+TKBPvtBGwFG+HdsfWE06/snJ2emcLJrXh
 p9UVnZizgpkaHN6jrr79KuaN79NI6+k3Vo6Z5BYcD2OQo70UYBQKpbM60rJJAaGPPEf375unp
 WgkPzQUQKAEdntQBNou+SO5pEW8ceWAnXZ8YOWlEuWUZfTB8wPtjfNXr5UY1vMBwUsyfls0/N
 msSxgux1Ia9We3FlwwxTU4fvYO9+kt/WSH0+6MHL/4EV3wK7weD2ft7KiJqMj6WAmQLH8Qiir
 v6d/p4eLly7Ffn7RzH1fDhsEngxLaC3ond9k7N0kgyn7KGxl/NUubS5QzIrXQbBqw8MpYZ/69
 tcS6fadiuXsBDDXKDAyr6KnA7z4jNlKhBvNYDFcYE80kz2rddFLytFb5YcmTucrFYvkKBTFlE
 xzPG3DuSO5yKneRABIXgoJHyLmzM2kGia9gK7thy1DYUe7SF4pa+Uhpp344seyuPL7OUsh9KB
 PBif0jQNAJdOE2twi+OaQkyPW9J7EbszqJu7iXWKWq0YDbOdZ8L4zvtRJOOky1w4kgHnVPsPx
 9DxTspkCIyFBszIOU0Ok5wxx4crybgRQxkoUCPVgyNMVXccC8tf3EOUkfrE5x5N63HQ/mPjIV
 gBWMnN/CAPkAAXeHdsh3woDbc8FTvOgewON4KI4jPNDZizAZ5En7ryfpJ2PLdHxM2LE7XXOzo
 2ueNwcGAo6MzrZXCHEYYWs9aPer1STwbyGCxSApt9LctJzvT73RIBfShYJuRSueI1meP7C9JS
 YlkEKx9xHO+E4UQ11jbCHeVy9D/m0PbaamwP3XrQttTXDyMwC6Nb/rlpHuJv4TMhk4g5u/IOo
 6NpiuEnN7rnKwrnREEboUTP3e+Y1nXj+wxo/q+hzSnMjrnqf10QEM/WidVgel65S7THL8evDN
 f4PJXwi+5TkgO1xppIVWqIcXddSHPFO/CtmzVt65zX7vYglakK9nLRgPZSY4GYmM3/vk8vNRS
 w7C9Vyj5XYlTQLOqfteVdyzqHFLBBxwcw68lE5iMRtoXyofKQkC/1Db7BGihKbDCBOimiK4ep
 uM8oNHCBwoFSS6KtD2IFETZkJjx52qfeJBRyF2YZ+h8PvT0EmSwb201tPLKd8Z+4SirR363DU
 k5bOqNs9Ap5eMjDUbKe6oi+sU8kmd5BExJFeAW3h8rN5EB8N02PXm/eMvofym+Qcyun8v6GKZ
 rzmhR/ZyB183gbv0Fq838BU3oYrOaDcAtk09/G7WePJuM9ecTuMZJ+DgQSX3JHP6h7IfBQ8JS
 Tkjf6mfVIIz/e1abPR6yliaNmft2Levmv0YQHjL2pWRmPV6TkEqzYOt4D0LH1Wp1qoSlj7SJL
 ZHAhfOpkAwotvXf8xorDy5m9WgnjFc1AeNzcFpG7S6KIIZmekt8+LbX0RVb3qzh3wENohP9Y4
 9Xvbg9i4KSjDx+05bNHMggE0SkfjuqXyb+vqwcfujrFRRcylRaWn2oZ9gA/hf1FUQvn7cJWTR
 VQ/aSAWg2UXGASKrje5VQ+37tcRoz5l7zJXXR9/hOfuD06A+D/1S2bdm155pIZVQldMeaIUQY
 NgcroPJVL7Pwfw/p2DrT6nJZ1kv70cIV0Y/AdbnC2uivQJILRoSvcWx39IEKDzsETwG55LdBs
 L/8bbE+ub1sZLBJTvhlCJKL1lA8YE8DLKtKEeL0ceIz4zlk8y+Qrc6RvilwqwReC+sbR+KoXT
 7AmGkGTiXYAD+/UujcsPBkZ3FIO/OOpPSFwdy39Xnb1Tp9FIWEqEWUb4RDrOaI5j0BF5CfWm2
 vYQfVWVQ511B2kBW7PLx7K6HaZB8IMv91XWODmBajosB2AEfk0CcElP/NkM9iyVA5Irqc/p0J
 J6fHDE4gxacU9I3FaROw06hqiuOsmAiaEfaGwzI/BmuSsw3ASrZhbFwVxKu9QY/B8ei617F0e
 6VBDkFwiAcVUsODbpBp4vts7oWzb5HYnsTK8U1qcAX0nuN2XXUmDAqATeQemv9PoowYbzkQ3S
 BLtPOmEP6iZw0YyjKLNsufO/obYl8B16m0L6frxWXvhUB0Rm3Efa/sUK7c+dNaZJhHE7hvjuo
 002YB2sAuP3a1c+j7V48kp/W6fBTpIl2cfjUkLGtDtRkq98dnwpNHzZ3Xne6Zx+wNPdke9i1y
 HQPGqfhFQ4XEzDBPuxMi4J8f03TSfYpvrTn+qn50FxvqL04oasUXdmL92022wt0C4YGv6fjGZ
 pzww84esXmz2+MY2obiSekBkI1iwid1tbYp/1W2uSn5yRF0a8ngS+DZ53U8/+IUEKjT9DtELp
 JcswFIjmPURScfH76qoC8AoIs0DyqYpFDuFSb0FO1qlUgR56So7BktvIbUcFOt5rkWg4nGFJI
 O0ETNZM/iOyIyznUtPRVTbMIShSxJpa7HSnasCKigVf0W2ku42qpVeewNax3dk9nwj+66cDxi
 OMmKxoM8qifOXFJDaMAXDQRSnzswkusoQHDFr8DAhThQBAIZnxj62wN5nV012bZJJ8PeykfZQ
 +G4W97mUIp6qr8mtzcZ8iWOsxpGqfmZexhttjO2+RRPA0s2SY16Uc+RG/5292nVwrd9qFt7lm
 ygYRus635N4gD059I7oE8WIOXctp41k7pNOgaevihj0h7WoLJiumhMjGqokZOOGpBpIs0O1kt
 5jwuMIvRh2otc/JUC3XOiauUlxcJw+uKHqPvAiafB+856eWpXM4DkHV43js9W/oF5eORzvx01
 eXQKjvpj95uo1mv8Xor1dSivDRL8AwZwhfiA0+uhME2tz4XTKGrvpq3rjFlE9Np5+rUOo/FMB
 CpWZg5AvoakcvPsAiSTcdWNF91MfBfhdyK92AMpmo82Iv7UvpBeAZEHiwsXxNtRwnuz23QY8e
 NioQv0IaRywdWRDOH3oV/CM1may9PeVh7Y1mL8uPfGduWHKCs2ubKMZrOUe85TRBMY6qTxQCo
 FrKv3/toaMiDxZe/sdYwjo42TpbkMgHQygfo0Q2g1eF/G84XxilYVrOTVOedluATCFcDqIEuI
 0uuJRi0OPAP94H3Ng2wZKKSGXvHV/SZixvNLctnXocE7SpuUvnBZIC9NCQxVAwsVTagTmhR2s
 RbX3xQqGHT1uCIQLsyNOndwPQB1XGlQCoMEn0As+U7kGCS+TPijrP5Cc3rE1uMnSZAYv54GOT
 L8HB3UpdW817tGP8zM9Qb11fO5kbbNRCGZSIBJGnyPR9xpAyie7qf/38pqDhzUBaqS8N9KAfF
 VhkAF6I5yIHXiqGRRg9b/EqJ9mPqcUMJwz35cKefzuNYSZ22A3NBkxh1T+5B2ojEFtqWvhDUW
 HWEmHTVmxjwkhQe690hdP1REUG7O93looQ0fyqjg9homJXviha/MqC4bOUu+X27+v4jH3oQtM
 bQEJ4YKr7NZ+iFFCvTDs3KIp94aczf2azuZYVcX33VGRHpQUfuL40oWsxtzr7qaJlhGRW3Twn
 RBPFNocwlUgmMF0TG7A98u7WlS7lNJJIWoT3f+Kz5LesBXDJY5C4cXe32FfV+Jg0pLtR36mGH
 SFMXyzd4Z2LtC5Ubn+4s2856TCNXlh/F22cLXhHYsTWkEiCHE+qdk3lGle7lgfv7/87xlmztV
 Yzm/VVzrbk5Y4rTZb549VC/wlE/PEYrh3g+0xIy15S4BZccAfVpPHq76yvpaRAHjeG3gUKpTa
 FzHLLZ8yrZjIcUlNSgHGPFTVaA2kGZ8qBiAo5jVQLeBFaPKJY+hL0NYnwOLSsr3v1SOmy1nne
 TobVh6mzS4kTByR20SPCl7XZNHkcnr1LJqqV993rC6DpjiugesiZtj+ZvXF5D8JskBR29OJEy
 6CUMbngyXyGQFxy3WB4V5SUDHxLezGcaiJkbiVf+g5LqkLAF0meg6MDTI3vJoE2Hdm1Si4MWN
 mktZJRHx0Vbqcje8dBTbylwEBbLL9XpuXOMW+c5CRg9PNOH0iDzyPaOuiudcmldN+wgCBLIex
 FnEnknj8lV+mQDRi6v4kIBYYFmkkDvSnsLzH9lKe/qoL2cKt3vMcKcBCIp5w/neWah3DrxLJr
 MeXEO0rjkOOCU6rV6sRFRMljSFsKTCwk+NJka8BlKkOHwTIGBb2nzuDGvcs1XqigCrk+WK9X3
 GBB7maKVGIh7QmlnMjPm9UG9/KArevBb4Zt6/cly2KJUghRxQ2bw8O+8g96Ilp3ZGe+1d65sL
 KFaAZY0LhsBxnig6ijiHe0zolMwHaevoMkAA7zxtbYkVy54vdlqaSUI1Ph5sqru+8SvmZdOKC
 u/wFKZiSuaB78tJVspinatBYyLr4BUMKp3348fICYAfBh40aWvJdJCWkYHvXnTtjf8juaDqWU
 VZrWaC83s+GiFEgVxbk9zM6wHOvjgt/oTeG4Nsh0htDY60v9B9V4t78H4PdPVJeRRlP68AInU
 g7pUco7AHYffqp0m8AgHvegNnEDJ07QS7JfF2J5jgjb9I7DZkV83uxMPmsg8XQ+sHySO5toHh
 qgpEAXexUcV6js9zufGkJulgfK9tOp0hQkYWSl78qkvUnKsZbhx4yJi1fg4wEM4NvFt/mY/8t
 l8iEb1ZHOxfpMPm+9ZW+V9w2QRoL0TV25UWDX7k9g6n33j/zFJl7dDDvphvZTyVLIzUi4EHCS
 A0uOU8QrSQkafx+Dq6/n7+ZbFJLTbPiwQ9rJmc6xDDZZ3sw16TNAidQ2umZUV1InF5LBGsXmf
 cpMcZUiUe/HqiAvsDgcLj2AhDsgVhA7Wzyi9k5pKQWwBg3JjQkp786GcpU9UW0ZIW7qTkl1kO
 wnw7ur01I2Ve1uzd0Z22pXbrn88IhloQ4tnCdubR/zmI85Xx8I2vBywr0XkJy2QAHNSCHvZoY
 F1JXFzN9VXRt76adLQRfrfhBR2yIdtrrNBq5NOs/gzvz2Uxh2UZxjIa3q0VCpQQkhfVuYVD7I
 CPah+nQ+7u2BjP55BPo/+MtK9XrGBGDco8MXgodcit/QNaADKQF4JGDLRj1cmmMbOcNWZ4SSk
 mWJfYFf0VraVf2shAx9rAgnx5o6597ZKXzeiqKWt+7Yh+yjFtY5XfnFdg+5nGM0Ce8BtOuYcY
 kuLHTsgPxBqfex+ZL2VQ0I1DNyBhD7dp2uVBlC+Lc53ZdNA9PUqP7mZcTX//fvI5IqFAxtjL6
 x9geVCTu5o3jjv19sNwCDR6zXFKj0pWsNnYNYftyfUutZpAcAnA2pSCQkvZr+GQJAtdv5eDKi
 tF7wT6gS+KJYOpoVo+mxeDg+RfMOMgZM1g8vBIirad4EKnROVfcdiGCqz1Fx9JU2OJKHHam7r
 3gpLzPjvf5jL6IWcP21MURiuhB4RQ1IA7WoF69P+sO4t3A+Tuz741Y9G7BONu/eJPkK9lfsDc
 9ct1ABA/c80g9fPeI1U0dt5gaOBK8dckHObcqerkmENLgYTb6j20uAit9kdE74FZQmlf1dB6e
 6O2yaprHAVY2h1zof2biZXPpJ4FQgG6pxtDY84sYcVmsts35lQnAA4NJE/E24HAPT/S/Lk+Ei
 +F0JFiiLin3/aEBdGwJah5BoHVuNx0LAGWpfKPk5MqW7v1ufR2yVP7pu2R48iktkDfooHZZ9k
 zHYVcro5AG6udP6j9pqb906JddrmzMfU3yk/YzT43ogNmdEhcD2t5R6xv5SaPx/4DR8wYaEgE
 46rz9tLkKp7Ck8qikHPs7kY2LAnFm31gdjqWRS8RNIQGGQSfHxvbDnaVr9BPulPdXXrNq88Sq
 p14o4SEkHB1tDQDOeeSSmbEeNwjko5BrqikKjKOib5WOR+g4MMacanhmwgD356/H2n5LchmzB
 6Djb1zozjcwu63suTYS7UEr8xGZP4eseTIm6w9SbJwl99cyiRde16oge0tWLX0okv/P2KYOHG
 hQG6iFw+ELsSVaMFQ3i+zt+POzkJwr5iXCClCTG1YxNbHot6TOJ65c7wSbX4RW9+lO0Qdbhcf
 jr/sv5Fa5TGaMYQHizmGGws66jzR+SrAg/MXXTn1Mg/DMgC+jMrKIazJTV+Xn+A5jhcyTFdHk
 IUHAOwDzTz4TgPxEwTv8zQHqI5UoLzTHNpkkLoBu1tioTzZk+2/GHGfjzWyoPtgGXzht6oh9d
 sf/tCTJ6a1Uibg8Bq+y+o+I5CsXhEY1F9ksphkFGoXuHjAYm8UreCq4IeOgwMGuwX73RWAo3m
 0+DHz1zMzErj1gkgm4x1ONtCOK1YbKoRFN1mI56AnC6VHghIc5KLjnfms01q01Yf0hKjC0R4W
 iBjQPlMOLawBl9Rgs8jkuXNtMEEtyV2jEfnXv6BSpdRPEifhqQIp5S2h/1CVXaLga5Hl5IiAd
 9XGEJ+ylABqKzOEuENue/6nNQy+w/5veir/fl3PIre0Ml9GuFBN6ihAraK49i/tOsI7aI6AGj
 9iII5xXL2h48Osboc56FrN9SLuQodxomDBXUB6xcfXfFXl4OG6/TSqCxNV2q4u95oWLb+bgX9
 Wnq1S74fOBBVG4pspQOIhpfuCGxFI3T8bigS2MD7rKSufy1YiQjAn3MM1kvKulmSprsnwZAqY
 lhC/UvPCqRVG7HIu2YX+UhfF2xTj/sIo5P641QjlfnKa45uXgAzv/pj5ws4VjUkiYRBVH7ZgK
 25BLhPLWkW3nIhb6sGpI7Tgz1THI4lf3JrDI9w0zCdeggxL2C7Ew/h8L2tT+oHN0rCBLINoJY
 sXd0zcQmnrWYPJE7a1uVH3WWNxO6yj4jecpAQIB9Q2GNanZ+7LQ3fhrtnvdL1z7KC9K03icam
 hmq1O48VNsYk8DIbp7iClBisqJqeLxj9WkHqOxXFY9oukqTAtFDvv0b04+OhVFfovckUwVQ+Y
 JKvbsSPPX2c2HDrH4svLuvgLQa0xGZVnkE4LS1i5OLw8r/2Ohxrh54Yc0XUE1HeraUNBI6Dnf
 FHRuYjpu45/u/EFeZ1WegBABo4/kkgfNmO2+yHoofxURJ1ZrUCFC7sCy58qAnBJYVQzu0yJ5n
 kyJDHGoZX8GF9xd7DX6yXxoXwTbKAv+GA0zTJJc1ocVNvvO0Yku6kRl1mXJu7uVryuSrpgpQo
 BmGrQfTib2WcSIA9GGldijsDMd5kNmwCz376hFNy/R5ov0v2BKOGTfgCHo3hC8BoGv5RkOKmo
 06UfgCqrDvZMaJZ+HpB7FrzGFGjhqjMKA6lw/dYKOpmpSZ7UDJntH3+KYhoS0d6T1QHVlbQWD
 7XjRAYgasuojAGvf1u2S4ELwx02wA7ebK/+Pix9NtQUzDeOG8gLluCDe3LM5/uzWGpNLupjbE
 tektDgC0F9Fjm67P4G1jrNv2jA6xZI3gV3h+shL426zCWy1XRiYRe2lsPWEJdP26tB43u8MnV
 v1jgi0a/nh1Ew9xnu6f0LfVF55715o/dZetx98G57mJ5u3lpc19viK/SuhPQnx+k/Q/qhbdJU
 K8l6HDsruJKQmnixbTawsT7C04Xuu0n6ezlsPqUOD3cDTQbMipervaMNYgR7F9hh6zbvxVh3s
 D346Oew9lOiyyt4uxFemvxbAAE2300i5doSnxnsSf+8RU49aw9RFcyMVy8ceeiH1FiK6CWQnu
 eebTbdwyaQEGoR1PO/0q+RN61dJ2vUpdWB4ncilLuE1XE7Vm1g5y9XPA64lUAOiFQdbCft0Gv
 tFJoecg8HaGgrhxYgNf40UTyadWFnl+eD7DZPdAUAMjlQ+TxSkliJYYpHcLP7RlJwdw8D7lc/
 3ql+moMNXf5Fc6NwHtCTC9s7MKzG194hBS4S7fXRgj2Uchk2jsbWHOleDDX4MkEo1r5tzJUzw
 pFegq/JpTVjoD+bdzqCA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Nov 2026 15:00:10 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Delete a clk_disable_unprepare() call on an error handling path
  and the implementation of the function =E2=80=9Crzn1_pinctrl_remove=E2=
=80=9D.

* Convert the data structure member =E2=80=9Cclk=E2=80=9D to a local varia=
ble.

* Omit the label =E2=80=9Cerr_clk=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
Wolfram Sang requested further adjustments according to the proposed chang=
es.
https://lore.kernel.org/linux-gpio/awQ7qa5FGG9RETtS@ninjato/


 drivers/pinctrl/renesas/pinctrl-rzn1.c | 32 ++++++--------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/rene=
sas/pinctrl-rzn1.c
index d8422d740433..64cef35dc9e7 100644
=2D-- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -110,7 +110,6 @@ struct rzn1_pin_group {
=20
 struct rzn1_pinctrl {
 	struct device *dev;
-	struct clk *clk;
 	struct pinctrl_dev *pctl;
 	struct rzn1_pinctrl_regs __iomem *lev1;
 	struct rzn1_pinctrl_regs __iomem *lev2;
@@ -849,6 +848,7 @@ static int rzn1_pinctrl_probe(struct platform_device *=
pdev)
 {
 	struct rzn1_pinctrl *ipctl;
 	struct resource *res;
+	struct clk *clk;
 	int ret;
=20
 	/* Create state holders etc for this driver */
@@ -869,12 +869,9 @@ static int rzn1_pinctrl_probe(struct platform_device =
*pdev)
 		return PTR_ERR(ipctl->lev2);
 	ipctl->lev2_protect_phys =3D (u32)res->start + 0x400;
=20
-	ipctl->clk =3D devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(ipctl->clk))
-		return PTR_ERR(ipctl->clk);
-	ret =3D clk_prepare_enable(ipctl->clk);
-	if (ret)
-		return ret;
+	clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
=20
 	ipctl->dev =3D &pdev->dev;
 	rzn1_pinctrl_desc.name =3D dev_name(&pdev->dev);
@@ -882,37 +879,23 @@ static int rzn1_pinctrl_probe(struct platform_device=
 *pdev)
 	ret =3D rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {
 		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		goto err_clk;
+		return ret;
 	}
=20
-	platform_set_drvdata(pdev, ipctl);
-
 	ret =3D devm_pinctrl_register_and_init(&pdev->dev, &rzn1_pinctrl_desc,
 					     ipctl, &ipctl->pctl);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register rzn1 pinctrl driver\n");
-		goto err_clk;
+		return ret;
 	}
=20
 	ret =3D pinctrl_enable(ipctl->pctl);
 	if (ret)
-		goto err_clk;
+		return ret;
=20
 	dev_info(&pdev->dev, "probed\n");
=20
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(ipctl->clk);
-
-	return ret;
-}
-
-static void rzn1_pinctrl_remove(struct platform_device *pdev)
-{
-	struct rzn1_pinctrl *ipctl =3D platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(ipctl->clk);
 }
=20
 static const struct of_device_id rzn1_pinctrl_match[] =3D {
@@ -923,7 +906,6 @@ MODULE_DEVICE_TABLE(of, rzn1_pinctrl_match);
=20
 static struct platform_driver rzn1_pinctrl_driver =3D {
 	.probe	=3D rzn1_pinctrl_probe,
-	.remove =3D rzn1_pinctrl_remove,
 	.driver	=3D {
 		.name		=3D "rzn1-pinctrl",
 		.of_match_table	=3D rzn1_pinctrl_match,
=2D-=20
2.56.1

