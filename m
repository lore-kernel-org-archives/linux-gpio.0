Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694978;
	b=i4JAoc0hSgJhmU3jpk4L1jnpZ648zo3bIK/vetthBSfCxlPqzNUtFaCxQ/3LzHRxhZ/T
	 Lj7SxLjZ7yr9zF2MJG/nzZDEpfII1/2WV3eeajZNkPn3rxRrZkA3c03d59U4iYCEEg0Zr
	 xbXeq22+RcWGQ135BrqYherHhYKL9Ms8DUmJF7U0Ga5ADXwd+qNPCdSDsba+19JiyEN97
	 LRE3S5UpN6C2gIqFKD5WCNsWLKBjmxFAXxWixJvJQGBb2fvJJQegPbFE4KZYICw0GXMiu
	 p4ZzMqVHBkUBx3e4vS9EW0oMHyUnj8ozW2jJ4nskeH+iOTUWebAdlvs5HYw2I20XGGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694978;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
	bh=N9loIwXH9l5EcrK/S8zYptofzvfYcswHZZ5CqhN+nq0=;
	b=gQpFEeMd5yGakaz9Vyjp7j4GmgnUKa7DORpLOV0wAZ0LmJruKH/WcaT6m4Kfgr5qpAGt
	 sKUZKv3Iy5J7DFS1xK7dHHoRvLmNcYd+/ulrqIq/DgsqMpsMxFaIPFx7GQVpcc2DG4AQs
	 GfIK9/k4DRVnxUrIVJVUbj3+1jEmAQ2UK3SaBs0YZP7VEbmhvrNMX4xRJUuLQiq3VJTf5
	 QDBioyELuy4CC+RrcTamqybJtkTFjyNEUfmKRKTrxu917gAH51qfexx/nGsVZ/vR00q5X
	 Tb1YTAXi+vJtcV/rYW7ECRe1+mo10xYL83eMI1CTmslSy7NauJHhyivOP0MLS4R/hFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vz+FVEyw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id D216F606A31C;
	Thu, 26 Nov 2026 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vz+FVEyw
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EF4771F000C0;
	Thu, 26 Nov 2026 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795694978;
	bh=N9loIwXH9l5EcrK/S8zYptofzvfYcswHZZ5CqhN+nq0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Vz+FVEyw3yNvr/Yr8+GzmgrDdA6wmU3FvEfmbvDCTFSItTJDO9Y4WQW+KBI34QVVw
	 T4UiR128Mt4IGJh2BTJixDcjqnTNlEg3+ih7ZhCurfGuYrSZdEhiQqVJ8ARTZucQOt
	 l4nPovQytKMhYoDhhsJfAzKDbhSsC56Nu2yECE9r9zyK9eDkbL2jvkuPFzrQbY4rKE
	 umg7jLdU1CS+Ll6GKWLrWRElIxsEbDwVk5aWJ4Fk3Wpy7Bw86NC8dU2neuyPxco5iL
	 PEmgFyoYWThst4/CZWyZXKExssJV+E8g8+Z+dQ1QO4/3AdzzhpJ5GxCpYYfQYl+GEY
	 3Tc/07HTY0U6Q==
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4cd3cbc4ee4b059a615363855bafc0767a6031cc0f40e2db82b7cec52dfc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 26 Nov 2026 13:09:34 +0100
Message-Id: <DN54QQWONZY2.188GEUWLPOSOS@kernel.org>
Subject: Re: [PATCH v15 03/14] gpio: regmap: remove gpiochip before tearing
 down irqchip
Cc: <longzhao@ambarella.com>, "Bartosz Golaszewski" <brgl@kernel.org>,
 <linux-gpio@vger.kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor+dt@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "zl020895" <zl020895@163.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>
X-Mailer: aerc 0.20.0
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com>
 <av6n3oNVl2pyeLBK@ashevche-desk.local>
 <58bc2391.8c7d.1a2178371d0.Coremail.zl020895@163.com>
In-Reply-To: <58bc2391.8c7d.1a2178371d0.Coremail.zl020895@163.com>

--4cd3cbc4ee4b059a615363855bafc0767a6031cc0f40e2db82b7cec52dfc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 26, 2026 at 12:00 PM CET, zl020895 wrote:
> At 2026-11-19 15:40:14, "Andy Shevchenko" <andriy.shevchenko@linux.intel.=
com> wrote:
>>So, AFAIR Michael rose the question that this patch makes the unregister =
flow
>>not reverse symmetrical to the register one. I took a look at this and I =
can
>>say that this is a bit twisted. The pure creation part is independent, bu=
t
>>to function it requires GPIO chip to be instantiated. So, yeah, this patc=
h
>>is a bit controversial. Let me see what we can do here.
> Hi Andy,
>
> Any conclusion on the unregister ordering in 03/14? I have a v16 ready
> (Sashiko IRQ-defer fix). OK to send v16 as-is, or should I wait for your =
proposal
> on the teardown order?

FWIW, I'm working on a cleanup and a fix for
https://lore.kernel.org/r/20261123040142.48880-1-joseph@telaak.dev

This might also help with your case.

I hope I'll have something ready later today.

-michael

--4cd3cbc4ee4b059a615363855bafc0767a6031cc0f40e2db82b7cec52dfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawghfhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gh9gGAifZoDLBVTUopK/sm7qAJUDYh1CcCxFYp
uxKWuNqLO9j4ykbverWkl2AWzFuKWQTWAYDHMsPzPa3+XVRpGYwMHT++yQCfHdDk
CPhXDtogiF8qR+wcMMjyhDQKZIaFdMcKrPk=
=KnlW
-----END PGP SIGNATURE-----

--4cd3cbc4ee4b059a615363855bafc0767a6031cc0f40e2db82b7cec52dfc--
