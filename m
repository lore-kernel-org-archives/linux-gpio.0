Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793877896;
	b=ixhi5BbecvuId82V1z3cuRFISo1XSWTpged56j2pRFqIE+MxkdawrP90O2oHIoC4QaI0
	 g7FX3vTA+UBRYj54Q0BoykcRO1ptvfzrH0QObw27sv91az/EkG+AfFCIrSg6RvD8U9RZ8
	 ZRp/EiKUmClgqs26yP/5bOlr9RbIBjN5oeSKl2z3Ww/oZWev7ghg0QlR6kDZVdA7aMrMR
	 pqgb73cpiUpkxkFmyydwTy3sI50U2soWzQpKZyaGW4suWeqFFxzYil0warTIsus9SOnMF
	 M77hAk4WbFgseseCxunBmtMMIeTVJTeaU8AfvmqMnkDWUmtsuAsWT2Iv/lEASCBKhyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
	b=yG5bT41pRV4JGM/nVUuWZEwdwS2GgasyP97GvEK4Tjd+gNm9mQaubKCWNLJYFJJ14tub
	 3FfPfkXNhkNZ6fA0i3mFQq7fzTX+nRiDjFG0110oOnFteLElcIQRh1HZ5EXYSbsmD0x52
	 xjwJXevGHD2vebYTuZVsmD7t3d3Rz5yRBaQ/4Rn3ZtVTiYCPXrRECHKtV1PJtbFD/hcR9
	 UUPh4qFLxI22rJSC0VdmdBKsMCTDhACh5RBFtNqGeE1tbSnY1BBVxbfgF5ARfQZTX5C0e
	 ONGyOQm+632ZF2b8MIY0f2h+Wjs5VhEHrphrkDzi5OSZHlhXTT23APPko9pXZsXCYVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCyRuxf0;
	arc=fail smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA8606A328
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 11:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CAA8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCyRuxf0
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4301e334ceso142790566b.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 03:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877895; cv=none;
        d=google.com; s=arc-20260327;
        b=JAcjtg3TvIMnCrq/D+EMZY/9uEmLmsew20dXA8od7Tpd54mF7V5FZSaBwT01Mx1fwQ
         MZUirk/e0Ug3ZA38PmFJQuJx6mymm4vdxJXX28cq4tSd81jZwMuS1j0tjuwoNn2cccYA
         h5dGkYjlYqPiUaQg10hXHuxI7iKiESPoRuMAQTIdCBl80fzmsuI9jXgqdyLJrBr2uF1D
         6a/YmqUkD1vt+XJpY+B9dy+DfqQIxnuRhUikLKwSz3onL3bTES93BJmCArBJ/DNOdreQ
         hxw06XWBzm0BLwbf5m0y0K3N+ck8sCfeKttb3NRnoDZE38ESEaqgMUKnFEjUvWWIwhre
         w5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        fh=+vOEKIPUSb0wJTSKfvKzoxn/POZDogvwKnE+hUP8H0U=;
        b=anaiva3x3s7S1UwZ4ZgXYibvmCjTR5MQkCfjdXB/WwWhYZ8h87k+512AeLGSpa5VlX
         GOIP/w+8KWobyiLg81sZc5QE/fTMZ/51tkFXvyCUHVszvKKCH2wytXMtwRexkOgVGxjh
         zlw0lZYwd33bYs2Ir7XzYzOJ9EZXHOHcCL2/bwm1qxjIW5RWlp82ai6UjTvgRJxo+n5n
         Wjq9hfVjpZug7xDRCMxKjdpx6sG96RQCCAEuDHXDfyS6iRXFhkhkisrAFC64OdZ9sHZB
         rCGq23X+nvOVI3aP0MC40qnFU4SXjnLGgo1QX0wO0DzDbjA8xp82tC7HZp+KrcBkHkca
         DMhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877895; x=1794482695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=CCyRuxf0P6J6k8bWApFVRzmmmQ4a3nezFhlH23PgLEzGEftofIdTYht54rkMPSxqZ2
         /N6dWyeLvZ3t5ckDi74aRNo2yvUplMuzeF87p+SrRLFswIheQK11EAMfgONQoUmsEnEe
         ak3lTmUJPNYDs7n+W3y+FrnQqNLfaVlgsCS7/AoEJSXFGJS/uoo6dTu0piEUOcSwoNXy
         qSQc4qOwI5/lBCfCziXhsnKcQriiZn1/LpLXFBVGVCBa5Nm1lMvs3nCLwfOv1t+ObDwv
         66A1hJWg9khNx60mm6v/I6sK000uQTULOFdYaXulbZrAc/k9t8/TzBP4LYJIO4G33uyO
         snLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877895; x=1794482695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=qqtVsNMmg1ieQMCOA1Htdo0Hsvp2NoNo5CGj1Xi13rqfll4fviqLGTMZ5zhdzDoDJd
         3BNLfVWF8+0y3X6qTFGBLyDc9T2FR6Te8KuD6IKZWVUoNXmTXDUAVMnxNsV87RPn5TWU
         t1Ij5fjZGcR9nG+gMLVIfeTHiCwFsUKLPgN3+K2DbByFWS2UiDwCRTiKmHKoBjmjXTAi
         mKUahbj6mcJ7GD6MX6OUp0sw5+Rqv/lqoZmj3LOv/abj41EeKWTQKSi8QRFAb9iyUhzX
         FjrTzNBneS3GhYK4PA0pnP/pOsLjDj+mqXM6tw4sCIwwXY6kO53A7SyeNfmgjG4NimVQ
         fl8w==
X-Forwarded-Encrypted: i=1; AKwUvBwA/FKRDsVmgFH4DrGLIAR4SCqFZ9SPp6nGNqXKpcGBu7/OGbuP9/0gnsrSaa3fzStBMlyynyky1xPy@vger.kernel.org
X-Gm-Message-State: APuU4Z8nQRDa8v3ZRaXxCQMih3dqBApXElSmcBSy2xjke3E7IxxQVkkq
	LebGLRfoB+HVjO4bMqk90jEg+XeVRo+22P2FJY9pKUdgevi3Gyf3WtZb2kc8g5LkY24wJHzP9+A
	3zOgDboIgXXn+bEeibR6DEi9QcKXFgmY=
X-Gm-Gg: AYBFou0GPc63V9U+dThTUJ/X/lcLLtPKBS74hit/a/eRUrj8pD4q48/VjuKTxXulA/q
	J6Gw8BtiaFOMmPn3oSt6qFSTZm+cBNJ8YqAPx1k4LpXVBNOJWDmI+M3v4FtwInwnx02GiIaL1fE
	zol4YDhk7uKI3s7lTclz/WLduN12Gd8jciKD5LRDOqkzAauKvXSfTa7bckYhHhe0POFLISWeL7R
	V6+u60SO2Y7UbloQgcJzpYXv9wQqCybSVQ3hW4oEB8bWmSma4abU54uWWnN0PG+N3TGpYP75pDC
	N6hTU4AkPgMNk9Sv2RC4JXCqVNz5PpXunru60zfc2rc80VCvfNofifneS0GGa09f50jgU5WIXQq
	7LNFUBBI/7K2UdCwsgpHmVZ7uaqD0oCA95hzxgFWEHZndMq1/hocb4paTsdz4sfjTgiE4praMqd
	8RHc4FR1MY5TydlHxinf4QCw4/Ox1LCVuM3kPhMxdqHAt5hi+sm36eisAJzb/hBCgUqC6t0bT3l
	ZtdLQdafEbFxM4dhzhFhPMzGMGpLpqjAYvgo7t8D5gitWsS2HaNljXRIItVYQ==
X-Received: by 2002:a17:907:6d20:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c4ca7a0dcb0mr1704269766b.11.1793877894389; Thu, 05 Nov 2026
 03:24:54 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org>
In-Reply-To: <cover.1793876837.git.alx@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 13:24:18 +0200
X-Gm-Features: AclHuK8KWMbqNnaK7YSgn2BAcqklpjMSStieDr0-B_LC0DeuPxzb2lhrGJOckGM
Message-ID: <CAHp75VdFH146fNhw1ysUbgCPbpv+K++kWvbyZxU=V7tDh0T88Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add strprefix() and fix a bug with it
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, alx+linux-hardening@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> str_has_prefix() is based on sizes and lengths, which means it must
> overload the valid length 0 to mean not found.  This is a typical
> consequence of choosing to design an API around sizes and lengths, and
> vanishes when moving to pointer-based similar APIs.
>
> This patch set adds strprefix(), deprecates str_has_prefix(), and uses
> strprefix() in one place to fix a bug reported by Bartosz.
>
> We can later work on replacing the other uses of str_has_prefix(), which
> might hide similar bugs.
>
> Testing
> ~~~~~~~
>
> I've built this patch set with 'allmodconfig'.  I've not run the
> resulting kernel, though.

No, all lib/ new code should be accompanied with new (Kunit) test
cases. Update the respective lib/tests/* for that or if not yet
converted to Kunit something in lib/*test*.c

--=20
With Best Regards,
Andy Shevchenko
