Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB043AEB37
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003512; cv=none; b=uJv7cOQwHnB5TzU/ApKv/pv1AuowtTM5FqnxZCX74MRP0RUNL8VB8eZxBsPLvN8Ch/2thBZNyRxNfb7Gj38/oi1W1pwdKCyiKVOwUQgiKJs4OZ8v/3CSgznhC2/LIT/xx+LOHa7Z7pcHAt8GJDi1MRBsb1Nel7vNzJnMvogpr/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003512; c=relaxed/simple;
	bh=lU9U9QN38XnK6YnkDIm68oTkp1mphR/YDOaEW77OJAg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=TafP3NuC6m7HyOYefXxedkp5ZluKmZCWbLHvCWY9Sjm559vsFyR7V9xK02rXa2iTzWZ+E7SvB2Af6BnxSbeKbePeD4fwdN3GWmkro5glG9npd3S+S0bAS+S3gvYhQ/GNwKtMPaP7M0WW675cVjhkFoMcvjjxBHfFoqyEpf70Q8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdYZVhHM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdYZVhHM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so26218705e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003507; x=1787608307; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lU9U9QN38XnK6YnkDIm68oTkp1mphR/YDOaEW77OJAg=;
        b=NdYZVhHM0eGlzUVk7YFW5/55rQXlJ5Mb/NMIa54FTJCrQcPAHIh+JYFyeySqV+KsMX
         fkyPUuwxNEDNBBM/CAEs/gGu+rcNH0QRAWUpBq16rVnn4EqNTB0oJOlLhApqCXygKXyI
         RbMHWOzwK9YiMeVasx3Ud4WB6NdiYvoQC+iawDL8z5r9SB1/D6CI2DMq3KPCX0O1VxB3
         M2/Kul8BgUAMQkWXleA4iSpaGkKkEvaIdbKg9fdc4JsvahDhXt+BNkGUQ3V4Lnn0biUp
         izWy3/sR66sMVrMVVO6SV62er4P7974SKehel0wn37II24tpzgroTgGlk9s+4laYMrtn
         sc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003507; x=1787608307;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lU9U9QN38XnK6YnkDIm68oTkp1mphR/YDOaEW77OJAg=;
        b=tLcbJFJcN3VGVcexG1xp2lcBfbI6RNoU438rn27j7dIyKqErjGE7Q1gyQKj6/jSKUi
         5JfXfQw90rgpxOvI2j8334fys0OseeHT1s4UCYARqK/HuXvWTo2DSHwDMTJHraghDeFL
         +0He/O1wtln5ETkFRE+sgM2TpWsjC8YlWr6uxf3f+x4ro962jqbwEAkFf1xQKohkY8Ji
         tS01CM40WoKLUnUM6DBLOu3E8+0Vni0L/sGjMuk5+TGizsraNkZxeeeaLhQaXy6nB4pT
         9KfaZPoat6DBmvpx7SBcq22JAOrWF4sIzabBZDnzyJIm/HIBG21VxZg66HIKhVpZYL/7
         7FpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrujUSd5Q0LBhVEZmm/l9YaOr9XMrIFJHXm/8nZ1rZuuHM5WHUfEpkX/X0nvDGd2ytI4w791v34nc9+@vger.kernel.org
X-Gm-Message-State: AOJu0YyNO4/ZpHn0V+a4D5282YLmyhR6bLYirXO30Rt1Eme0MqLrZrmB
	vjuE9mjacd5rXLPoGyuTOzpen1w7VlH326ERkJsTMBeZmAdogneJ2MHd
X-Gm-Gg: AR+sD10eCJ2ZTBjBojhvGTidE38wPt2wR8tqKX7Mvz2LPSoxCqQGblgMbO5Z7oInl3u
	pTjH89voLAQL3rUzj48MmnFzqsGvlM8hl2vozYj/m/fhbms4rn7ys3lWYrswaiVyVl6XxPiH6E1
	+yU1xValeZ6qZaBmNXaYs3MbrPDpUIC9tS7bHxuvAeTJSEqE2RuJYG+XSlgMZ/2kRA49AjB0TmE
	rs4Rs+7xhnPkh2Sll/fBeNS2+32zbN/rcXnpdFygQ32jR9hiZVUxtf57V/dCd+OPmse1h6hT8qO
	19kF5Iw25h/QOIOIZae+qxek06Rn6CZfil18j/N49SQAlEeBcG8upS7Em61bPZitw+4l3TLLuj2
	ADhJcBjPwWsWvk4o+W2N8OL9wUmR1/FiSsJwmJiWrl9ALU9zjBrnCbQWwXFv8k4LACRhW+jN4zm
	jsYl2dwwcTRTWnN6tziquehtrTGd320h1v1so31METjxs2rxPnEsJ5orhLF5yMjWtl357bFaU+t
	Lc0JloiVZ77DwiUSKr2866vvThfsbiW98eCUZP10aIp2CAdfVzV+V9WnWeHODRAnA==
X-Received: by 2002:a05:600c:3b1d:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-49988057986mr422726375e9.0.1787003507537;
        Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998777caebsm301129065e9.0.2026.08.17.14.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:39:13 +0200
Message-Id: <DKRJLVL3NMYG.2J2QX2YKJJHKW@gmail.com>
Subject: Re: [PATCH v15 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-15-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-15-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

hweight_long(des->info->versions) >=3D 1 is true for any driver that
declares a version, so the check makes .set_link_version mandatory for
every chip driver. The "Multiple version" message suggests "> 1" was
intended. Both error messages also name .select_link_version(), which
does not exist.

An automated review already flagged the unguarded .select_links() call
in max_des_init_link_ser_xlate(). The same unguarded call is in
max_des_ser_attach_addr() (out_select_links) and max_des_i2c_atr_init().
Only max_des_i2c_mux_select() checks the op before calling it. The
">=3D 1" check is what currently requires every driver to provide the op,
so changing it to "> 1" alone would expose those call sites to a
single-version driver without .select_links.

In max_des_parse_src_dt_endpoint(): "Unsupported bus-type %u on port %u"
is printed with (pad, bus_type). The arguments seem swapped.

Doubled 10/12-bpp is handled at the PHY level via alt_mem_map10/12 in
max_des_get_phy_mode(), but the pipe-level dbl10/dbl12 (the
BPP10DBL/BPP12DBL bits the chip drivers write) are never set by the
core. Only dbl8 is. Is this on purpose, or should
max_des_get_pipe_mode() set dbl10/dbl12 as well? If it is intentional,
isn't the dbl10/dbl12 handling in the chip drivers unused?

The version loop in max_des_ser_attach_addr() sets RX_RATE using
set_link_version() and seems to rely on the select_links() call inside
max_des_init_link_ser_xlate() doing RESET_ONESHOT to latch it, as the
multi-link paths do. But max9296a_select_links() returns early for
num_links =3D=3D 1, before the reset. max96714_des_info declares both 3G an=
d
6G speeds, so on MAX96714 the fallback iteration writes a new rate with
no oneshot reset after it. The fallback rate would then not take effect,
and a 3G-only serializer may fail to attach, or attach with the wrong
version stored. How is the new rate meant to take effect in that case?

Also in the same loop, if no version bit is inside [min, max], the loop
ends with ret =3D=3D 0, and the code after it marks ser_xlate.en =3D true w=
ith
version =3D min - 1 and no serializer attached. Not reachable with the
current chip infos, but an info with an empty versions mask might hit it
(an empty mask also passes the probe check above, since
hweight_long(0) =3D=3D 0). Initializing ret to -ENOENT could solve it.

Kind Regards,
Artur Andrzejczak
