Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747170;
	b=u6j76/NzRHqCdXIJXwOeZrqtKsmDVUVBxA8g07wK9lJwbX0Eq4IkqLNYPCsDBXk/EdyI
	 QlM2yYoG9igV0/7WN88aJfG2Swt2qJ6AEQB3Z8+mUZfgjhScuJUfbIqkojDjzMzQ6cFbm
	 u97HDeoAPDaCs6UGP50MXnJimry4mxr0E95U12go18w3PDNtnG3LFd4aGHGImJc72fnPk
	 9wB8/pGNiMTrh3qehnZhukcDpjhhcv76GdufVtih4/gVMaA2P2sncaBYsxWaxdB995evm
	 Ia9snFIOfzCm54ardb2Hu29JOUMdLKeFN9X1wx7V5rzPsjou2Kza+lbh9FbCYL/rsdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
	b=WQ/2cCjx6dezTHF2lDVJbNaZgda4Z7xQbAxkiAamF4NsVpXcu5CyNUDbd1hLuakDQtha
	 alI48vDkl9jxBg64vGoOYl/85HT4b/eRxLtBp8IXLq16tmEP7YbBveUK1IpIDCDTjavCt
	 omDBBlI5awU3KmwntGYzRY92oYlARQTYOzHfGI9ZGza5a+k9Urcoxjq4M5duxalLy9liX
	 4E9/ACZc0Khju6g1vvjU5IKbG6FYfjhTp7Un1wHhbnbwqo+atiQ/dLP9kaMOrKDbXBCci
	 2FXCLLQp4Pzzi1ANLGzVnyPqcSrQZG98fkKTZ5cjUUZfDIUScjHm1N2GQN7owz23SmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V1nv8nw7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A9606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 09:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V1nv8nw7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215e64962so2307515e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792747163; x=1793351963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=V1nv8nw7Es+VgKoDXVxc2xoowsXtxzg4VOgfLThVNmD+M2TSPogeK49BjUSvA0Jv5L
         Pv5BHJpFeO6BLUSu7GXLvDraEV8/PDb2l8Z4ioMuWUrwJZw8TVg/h1PIOwJPQALK4Z6Q
         wQrror1EM3CQSHD1uXgcCPYJVlXMhWwOVV+FrwEnZ1Hn4TR901b1o34mlK8lGL4AwGy3
         8O7/XatVkZEvCQl+BZMQUso7fnujZsgo8hBG+CTHd4zunGhpg8sWGbRY0cOYIgGNraon
         zJyWaDdIaMKhmREnscAlUZ77uISpNRcd9G5GLS8LRmwPpAFazvOUpMmuWLXZk5Bq+6mk
         mtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747163; x=1793351963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=f100UeaYRluQFFZPksk2fpekBqf77tHjc8EKdNxxv6QtiyDI3JMl3j7O007JRhS14w
         OUH8GsWwPrb50uyutrAtPWhgPkNZ9J6ePzr2ScWhQi41QvZC9lwJxG6Tp4SVe8SXIxUC
         mUPSe8gPC7uiMsG/TTiCwYZ26cX+UqJVHCM6qCR2+XQY9nI9sHmY+QuNptk9cHReAshj
         ToX1ut9gMnTGX3Yqf4m+ZdbCrTwMnZgEpz9WKLeYYHPIRHI2CXJkZZMQzrkQkbl3Zr/Q
         uJrBW313anihPuQP6CKwm2ti1zvdQ1P7XFNxT13sI3AAJnpHmF5Vmr/y5My/m5UoVGZC
         QNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNqktMrdo4NPk4vh+f1fBIS58VcL2c6mOVucWvxA57Qim2fWMxND8ZmionCfJhaNIh6WUOR0rUDxfK@vger.kernel.org
X-Gm-Message-State: AFq9FYJYU3YHrFHjkOvofuQbWMmydyTNJkWRwmYWWsEzt+NX1GWy8ud2
	IbHtLbDoVToDfryqBp5MCxcwwDA6IbtqN0mS60Ou5kKRCsdH2k/iccIYGIAl8DKnee0=
X-Gm-Gg: AYBFou2GTdOaNyP3V7mVBLVuCL2W76wTOin1PVrStaGyOeY7ZeIwdFsd71RZPQmvoF0
	3KqEYqj/DZP/937RE6+rmBbqJOJYqhh+o1jTcwGgEw7i7QbMvjP1Ri+qh3lM5RCPv1eg6jitrhh
	MZtcJsrj+NePS/8iGQzBIbKRHMHtzZyhmNWRozq5e/R7LSqwj4LkfDcLgBmA3NT8YKgzrjMiQFJ
	VC8qb6CewiFpS+gg6qwPUq5qYHo9qkFmrWnGwX9GF3aXEdowzC3G7RV9l2dCBNFKCij7OgzpI1g
	T9Q6EOvqxmdTTeccS3iaVpW4e8ZWOLOAMmHh09FNVWak21SdxWVItqGVZsLPdLpRE+0xBE+zFLq
	CZLpnCvZfn6nkLT5g8e0uZ4I5YmpudLKbY+oMvozbWzgKONHu9iTLER6Uq0vIndul0Q6h1y3W5l
	wtG3NZDElaqbxd3efse5tLfvxrd4GRUfvyHB/AqYJCmAVVyHUA0DYhQJXQJYUlKbJuyyICtK9nI
	cTDg7pkgagVbKXpky7RY6MBGcE+f60oEPe/xgm8iADeynLuDxkOBlouICC0r/NlmPEmKxCXuaHc
	pkTTzY1DFBqwHPyXTcTOFF3i3l3JgDn9aBU2qaWVDJg=
X-Received: by 2002:a05:600c:8712:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a211cd5eb3mr28983755e9.7.1792747162862;
        Fri, 23 Oct 2026 02:19:22 -0700 (PDT)
Received: from localhost (p200300f65f19a9045816c66224fa2d94.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5816:c662:24fa:2d94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a211ba3e22sm53005535e9.8.2026.10.23.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:19:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:19:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
Message-ID: <atsmP_5sX5RFunft@monoceros>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
 <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="covttcbalrymohfa"
Content-Disposition: inline
In-Reply-To: <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>


--covttcbalrymohfa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Thu, Oct 22, 2026 at 03:48:17AM +0800, Han Gao wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> pulls in many unneeded dependencies,
everything it provides that is relevant to your driver should already be
available via <linux/platform_device.h>. So please drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--covttcbalrymohfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrbJpUACgkQj4D7WH0S
/k7J6Af/akzqmN8ibSwrfi12ffHOWdI7Our+3A4vhm7xG5fLhDxm5RVyO9IOnbZF
hEEqQasZCXUckEd3P8maCUNMZrumlljeFYUKxiiGeUptwiJNhDfD5gwgvKN+QznX
WUBMP16Z+bJ04qU+9Jvxwu2AZERVCQgTDx7HM49rEY2meQdARZ+74mmtm7x3AKyE
LAf4maK05HpWCQtSPGWBSz9ZRiv/TrfMYyA43n2Say17TUHYMVEZfRooCn3JlUBB
TybkgcHqyHLbqU2SVAqhlZIuIVWIEQWz1aD92G51OANqUqboJ0wTWbGxYyrQMMd/
VqEBROgHbira21nt4uuVoVmMDk84zQ==
=XQ/k
-----END PGP SIGNATURE-----

--covttcbalrymohfa--
