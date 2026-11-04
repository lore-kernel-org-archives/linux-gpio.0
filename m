Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795453;
	b=23pyaEXduoUscCx3Ay6MKIzIbPl923XoW4aTT3Js5FXEjcfgrhJALkX9Lwg2mSDw4PTo
	 LqPUcaUthL7KkAxp0qthlN3wMiu2WgXtSh6SIi2+W7uBboQCSJmsG68GyYwz8CFAdMrfA
	 zhIzEdYNBAgOuKzZhN4HULjGllDHMRpu4BSdzArxg5VMkNpqVs7B3dvTV785iIUUoqiRx
	 hxH6CuXI1tUG7avOYokVy52uBLF9LmyrBCpTv+DSbnPmZSjm0pJdT8x1RWLFCKn7JZZdl
	 p4KElskT6knJhT1+B32QbkGd1S7dQuQ1+ujfXpjaSpgUbNxvg3ajRCR5zxduhGylmiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795453;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nLTKrRV7zGj2+I2eiQhkslScmWRTzYP0lSx7u0c6KX0=;
	b=2vVPuu5K+GzROH/+35dPj21MLzDrjxfywQaky99Td+MZgPdtkeFJ42hWUFomzVkrjEwK
	 5qhnRXRpUUt4KrnJ2W9jTlx59kkoe86RHm7JgvzA/9Eu60F4q1fEqBocmishFvCc8Hit7
	 WFv63vVWPnKcj25NdL9mpT59Ukhq12q4t/GREZVj89hIFfvwgXwfM2g39P7W7ROLvBlpi
	 PNd0E8E9ELslJsN2BvdyUjNJ9IzpI5UddiDF0YepNkQ5O0xqmStwtDZwNvW/vVLU4pban
	 PHj9coTKtR8ZPlIxhzacIvxH7bkbbkyMS3p97TyI3xpzmGNrA6EGDY2i2+sQwDwRYWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+eOpIVC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B784606A330
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+eOpIVC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2228F1F00A1C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795448;
	bh=nLTKrRV7zGj2+I2eiQhkslScmWRTzYP0lSx7u0c6KX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i+eOpIVCD6c9q3d8U7OaPRj1DAkcCbwKg0e0/FB4gvbWHhi53k/RkjVa0uRQXDCQ1
	 zAvMD+YbSdnJSgGy25maWzemVTB7PwuC1McmSi1j6y2JieTGBPLJN1h2Z1OLzBVXPg
	 j48YnItp8Vtjr5vRU1ggfwvm9WN+pdGbfrSw0o+XLh5yr3ygW4Gu+yKjE0BlN9XR5y
	 uEjIJ0p/MAGSP2G908hwhZduD9zfnPlyPpCVzp4pdXsXiMWLorsj50bnoaX7EhOjjh
	 Wu54b2wlES4jjZJ41wtWivS0w+8qvi5sNm7SSJtwrhbfe+SsghRpIg3Xir1PcIdSlC
	 Pnt6va1saxJIQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso392353e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 04:30:48 -0800 (PST)
X-Gm-Message-State: APuU4Z/SCwuoqLwGz3VaIzVFCSgSqhpogY8iqbrkrKJvLiZ7K2KkBXL8
	fMgalKvFrNkAlIyi4ZAMBMc6khczopjd/kmmdK7tsKh1zqHGzjqwO6cJqhM4+OxXVcnQA8JD9g+
	cJHYGqEfocjP3QeCA/IOg+b1mc3H+p6o=
X-Received: by 2002:a05:6512:a8c:b0:5bf:c97d:d170 with SMTP id
 2adb3069b0e04-5bfd11f352bmr5131215e87.17.1793795446847; Wed, 04 Nov 2026
 04:30:46 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:30:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLn8yxh3LmUzbb2vZfJFJB=_mCZ+VeQhnZktfmuMiv5uEg@mail.gmail.com>
X-Gm-Features: AclHuK_xh55IfYWDcMEadkkQPRWoFw-pLiRPci8jz0ty-rrKgkyopgwVmzEI3cA
Message-ID: <CAD++jLn8yxh3LmUzbb2vZfJFJB=_mCZ+VeQhnZktfmuMiv5uEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: fix group/function table leaks on consumer re-probe
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Lokesh Vutla <lokeshvutla@ti.com>, 
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:52=E2=80=AFAM A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Pinctrl drivers that create their groups/functions lazily from the
> consumer's device-tree node in .dt_node_to_map() leak the per-mapping
> tables when the same node is mapped again. The core deduplicates
> groups/functions by name and keeps the first instance for the controller'=
s
> lifetime, so it silently drops the copies built on every subsequent
> mapping - e.g. on each re-probe of the consumer device. kmemleak does not
> flag them because they stay reachable from the controller's devres list.
>
> Reproducer (patch 1, pinctrl-single) - any board where a device referenci=
ng
> a pinctrl-single state is repeatedly re-probed; here an I2C TPM whose nod=
e
> has a "default" pinctrl state:
>
>   while modprobe tpm_tis_i2c; do rmmod tpm_tis_i2c; done
>
> The tables land in a generic kmalloc-N cache (kmalloc-192 on arm64, where
> ARCH_KMALLOC_MINALIGN pads every devres allocation; the bucket differs by
> config), so watch it cache-independently by diffing /proc/slabinfo after
> dropping the reclaimable slab:
>
>   sync; echo 3 > /proc/sys/vm/drop_caches
>   cat /proc/slabinfo | awk 'NR>2{print $1,$2}' | sort > /tmp/a
>   <run N cycles>
>   sync; echo 3 > /proc/sys/vm/drop_caches
>   cat /proc/slabinfo | awk 'NR>2{print $1,$2}' | sort > /tmp/b
>   join /tmp/a /tmp/b | awk '$3>$2{print $1,$3-$2}'
>
> Patch 1 (pinctrl-single) was found and fixed with the above test on real
> hardware. Patch 2 (ti-iodelay) has the same bug pattern - plus a missing
> .dt_free_map that leaks the mapping table as well - but was found by code
> review only and is compile-tested only; I have no such hardware to
> reproduce it.
>
> Alexander Sverdlin (2):
>   pinctrl: single: don't leak group/function tables on consumer re-probe
>   pinctrl: ti-iodelay: fix memory leaks on consumer re-probe

I got exactly zero reviews on this patch set from the pinctrl-single
maintainers, so I have now just applied it.

Maybe the old maintainers have other things to do, have you considered
signing up as co-maintainer? You seem to know what you are doing.

Yours,
Linus Walleij
