Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793878075;
	b=RgvA9H6rnsLdFiZW4NiFomLMNhXu36HfZgED8Veq48kGj+RA5bjXtaP2djQXqvLQn9KR
	 6VDx6qNFaqagEqrI0uD6At4GgR9ViPz9641/4dCKlfqEVrhkQZIbGKeyuGezqlKIjh+/L
	 /ZkfjH/UZdtLHHod7om/kUMcI6X13S2yY42lBqgV13pSQuvSDpn1TIQEQbtX6R+dBdi7S
	 Rgc3avT8XZhK+W+HFzpo5mAr0grkU+l0X6JEZbP4aeMqXMQFw911Xl+f8bKUD0Baxi+SZ
	 8UFzJ5qyL6OiyQz/OElMrSWL4iHClU0aXfQefSfWusxoQP6+S9Hw/UBFlxKtgITKexA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
	b=Y9FCdCq812i4y5PxDczFo2P8DDZygyWAYw/Epy2nfJ1jp3KrZ6anzy8a/fIt5RJ00HgQ
	 p/FE1QK3TqLQR12w/lGIrc1g+dgpwA2nz5RbYmuWFmb/3VEAKVQJvxp+ql12OutmyJY3O
	 oZLz8j4AmscB0/BYA97/69cjguIU+oO/g7daA5d8VatNY3soJPKeWOGqnFA+JbgHD4oqB
	 96WDmIEtfqzejvsHbLPmWPdwXeYaUJh4Stn7su1bgZpVut8PO4MmWbX8YJKCtqg7MAMFY
	 F6Ed5zzWnG4fO+i2OTb4Kky6/MmF/5zSol05ge6L7Qe0VVZLnmmjmiWRxLWH78hu+qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skgm5fm6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2A7606A329
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 11:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skgm5fm6
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4ceb15dfd7so232852066b.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 03:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878073; cv=none;
        d=google.com; s=arc-20260327;
        b=ZN6SFmai9gnkDxHhIAutN7o8N2x0VveNsvRZvJRAWKLQ1eSmr4E57ORnMgZqlmqqr7
         knMTqNhZX1tEMdIXD8tPy42icGbXrMQxc+ANxYFxkkGMKuTeVtWO47DgBMh+38sj3Bvd
         0iBtUkPDXt0CIsJpXCMKJW6WQFx6N0Pfc5yVDcRAy9ScWbcMJiwnNKdWIWkm8E3kbB9I
         MuUm/7wBR96Pi2x7+qqRncMnhckLJXMPguYuC6jliZtY5qKc4lbxhNc312zHfY0ri/kO
         aer19hdH8bJvomzNZNI1i2hOtnkZyeqrQ8N/X6ssIRhzEjHOGW79B0DhBjqxtyR3Mrak
         r2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        fh=tGx8sctfJvaNsevZHPG/EDBhyz4fG1b05doymbMGjsA=;
        b=cwJLFPSCC3bVXHVoqp5E2ovF0wpVyJQatZ/yIZf4OaT4zvMCeY+JX6deB7EczGPb1G
         kD7xrMCjV01oKNxACGUiG9d5zPAzPPciCRX072PM5NlI+qYhY+GRN54M9ZZ/UjYz+RWV
         qNdoSOHYOZ7p5NlZinh5xhR6PSGTqBnICuPb2evfoAQ0r/6Iaqft+690WHGFgjw2niRe
         BJljX9fO6aOIsHdCSFLTtFSVjZK3cmHGfrIsBYC0aUE6dfkZhJMV9+2Uog/LY/rvQ3Br
         wxUhBwaH1GQqlt79LpxHNUsTXLxPkymNRNfjfQCo0WEcIG/Yjg9794XrnSOQcU2yqwxK
         Qkyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878073; x=1794482873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        b=skgm5fm6oAWAgv/QVCq1EFm/mHk6ogMQEriq5kNbbrdxCpxscJsl+DVbnoxhuFlxLd
         vpOEAXk4t8Us8lYbydo4Lkh/rrArrqli9+hvlvKBU8YfaDLyI9GZGKoooB/b0vdPaMYV
         JuKkZi4KuhaladOnnC30rn5+5auFXjI7odgfwe3bCKV6tngTAW6ACSoUfVCWKJqsXKIX
         jxEtLNpajovzg1ZAn6mqM9CQndl7qv0vcjhh+A3vKBUj/zkiqZVv5xWyOSeziy9qx4zd
         Srk8GDlwmg/wA20VyrcEYyztNba9JvovUh1RMB2E2C1KTO6V0On70HG6wXIEyNfWKBLP
         SN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878073; x=1794482873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        b=X9uAVMkk9tpFehxEuYxSuPf4hrlAU23BGbc1M7hZvkOJrahZQe9dG4PqjgdnhfRaQn
         kamEHAumv1kKz+QrGFn+DkY582+u2dLL8EMflWUXf/tebG+UmwwcrRdNiCwWZSz+sm4S
         5cCqS3NxiJiH2VcgzRWZSSXNEAcT8/qajBRNulx9arM1ACzDwwt3VH90WZ+rVe7fh6+v
         4X0SdiCDJnnWl9ui7kdxS1XIWqe5QwlPQhpvuoq5Jn9ZvWatEOejwqjA9ZMhM3g2jW2C
         3NFaq5CxsWmPzUStZBwfwuFdqtAL/TfgIxt0yHNwhT8Ix91JEr6D2wO9P6TqlkpJHgG2
         yT4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxACSGGy8igQ8hKLIAxFv6AXLZjn2ITZ5VOH3QNMi8u1rNaRzwqm9DfoIZZUxMsUdT6xTHwTOIQH468@vger.kernel.org
X-Gm-Message-State: APuU4Z/6VqZQZlIPf59YIMo91xCOyaioCxnA60AI2BDq6bTEYUo4parx
	uvFHQKh+3MnLBbTBfwcKAQTbjiwdq7eLVzwSu7ivNAkTRgH9+7H+rewpUodi2FkfiGRoh+v1Hkd
	KhXQ8Sax1715HHCJNEMupdfCOE20BDKk=
X-Gm-Gg: AYBFou2V1AuybOB5WaYOQnXeT6x7bhJz/XBfRk1qneucZ7xGu9eE9lENRucGjJdwO7q
	48tIUiLpsYyWEw/nAodY5avdbaYsbiFyasZE/f/BG1pzagTqEwHGaLdI4UTBxYSoImAXx1gTgaH
	+gvBRWMmkvGuYcSu/gktgmRq756wxrrQDtIsvWdLkejxMRAf06O7Wl6K4mhAbVYyeUGHkFRdmSY
	xpEGN1SO+KsFbctALeMcO2BljAINm4Wlus6cReMSzOIG2YFLiEQzlV9pFfxFbmGGlhQTraBJwRN
	EW4bKEud+EacC7DdqIhMpC3mQjCG5i0QeqQFkvzobUHV0JEA0KokRym+OdK/mE95kcfOO1Ofz0/
	cthcDOIhkKROI+IT8Ptx/3hRze7GYuJVcpAcGfq3ExSQ+P9X6kijTFpHPo8lQYKGB44u401jsfg
	wQDO1DXkSnqd8jRxut4UsQaWzX3sSK6qws4TeVc7syenvM/5DG1IimA3l4wV1v8hfIDDvdB69uw
	tts+xwDvu3rvRcoYoGH5z7sgmTd+JYTlktdlEguAK4xQofWkrKmEvUTFzfe6g==
X-Received: by 2002:a17:907:2d8e:b0:c42:102f:15df with SMTP id
 a640c23a62f3a-c4ca7a0dc8cmr1782618666b.8.1793878072888; Thu, 05 Nov 2026
 03:27:52 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
In-Reply-To: <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 13:27:15 +0200
X-Gm-Features: AclHuK9RJR52OSPl8iPokfz3apA8SScdKPa_SxHmGln1p0LZpPbZ_VJGI1ROrO0
Message-ID: <CAHp75Veb=TsXJcjqQeD3ciNGRvLebGr8t8TnZju6FX5ANeVNTA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
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
	Steven Rostedt <rostedt@goodmis.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> As Bartosz reported, str_has_prefix() has a bug: it can't differentiate
> between an empty prefix matching an empty string from a non-matching
> prefix.  This is a fundamental design flaw in this API, and not
> something that can be fixed.
>
> As always, this is a consequence of choosing sizes instead of pointers.
> Sizes are often the wrong choice.  In this specific case, pointers are
> more capable of differentiating these cases, as NULL is a special
> sentinel value that doesn't need to overload a valid value.
>
> Let's implement strprefix(), a function that returns a pointer
> right after the prefix if found, and a null pointer if not found.
>
> We'll slowly migrate existing code from str_has_prefix() to strprefix().
>
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Ouch!

> Cc: Andreas Schwab <schwab@linux-m68k.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Saravana Kannan <saravanak@kernel.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Tom Zanussi <zanussi@kernel.org
> Cc: linux-acpi@vger.kernel.org
> Cc: driver-core@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org

This list is twice as long as the commit message! That's why I highly
recommend moving it under the '---' line below. The email headers will
get all the listed Cc and git history will be clean from this rather
noisy list.

--=20
With Best Regards,
Andy Shevchenko
