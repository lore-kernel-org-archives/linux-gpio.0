Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C012641D106
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747136; cv=none; b=DlWD2k7P1E/NjM2TYMrjhJmiVOPfWBALUO4O+Pr1KeSuABb8kf1gY09HGsPdI/1NxLu9Ir6F2KqGrxGRWVyHuMrxIYgeHdWHe+jg6hbpkf2q7VP5Uc9X1EUDHBEgQAXXz5ptqeEIj1DLu/+mr9l+vuqx1q9jLh7ACWXNGoFh/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747136; c=relaxed/simple;
	bh=G/4pYCI+p6biU0oob2SAOB3uONa8AVChe5krxzG7DZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDRd2kkz6JN1JHDM1qFWF67kfOtYcKjKKUhof14ZLxcSyKsm57gTobWh9eqArHtoeackI6+nl6hNAccg27aA9tO6iWl6Wq2cmBwPlxZupmG9navzSD0K9lv20GiAJvGgRLoGE3LjTajoOQ5kxNb2wAKunndbPfCX2BjCNrDW1+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhUMNIPi; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhUMNIPi"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39686abd426so426412a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 05:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747134; x=1788351934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QLB1RbqXq7v7CNRa3wJukW4z5hiwan9Z3mACetA9txg=;
        b=HhUMNIPiTSQVpBDqwuYr1bDNISgpuMItOcXrP8pRE91ZF2A1Kz6ESIQ9nndGokElNp
         61Nv3Mlz2+BCWHw6ga38qZHnQR1hd6hba7qAFyQB4Wq+eQX1ZYa3X2E8qCEljS/B2v7R
         auFYK8/B3vBhgBgOhDQhgiaOgIehTTNf1QYW5E8Ya4UfKmicEn/xdluepOMRoN78KvOl
         ukDq7CEomaNwUfDkNKrF5IgODpG/RCs5J5ehaJUWOSe8UeJsz1sSMZD0mmuJTlLLBxo1
         TgRc3X/ilTb5y8+QGHmu/R7oqlCI0f6h8jL3lQEZOXTHMISfPV4o6Shkfq3YFCr0HEN5
         ffwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747134; x=1788351934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QLB1RbqXq7v7CNRa3wJukW4z5hiwan9Z3mACetA9txg=;
        b=kRZW1BJJdX4nIHZhcabgQtBsOuszonSYpdjn4Q0NmwYvdQXi0GFKOSkULxhhbRldyV
         CUkJwWczscd2j6nZ7KeejC55IDfD5Bw1NThaRQo27Bpsj/pQODmZZ4oSv5hU2MjGrjq1
         vkG/3Ji9PhoW9HT3wXbCNHikbgXB7OPsqlkr9KPLStp7lpRZHm5CPXVbplPMVaZL4c5n
         FQKIbkbJMG2g1UjNL2Uh+7wnDY26iCn1bMbcT4kw5WcYE006U24wMqhcnkeb1GSwwPNA
         bYMsnibV59gxW40jvqR5QD/3Fu5EzhK9dr5KsPvE+TpqFIh0DMYkePfFYUxcLOouIBiz
         u1AA==
X-Forwarded-Encrypted: i=1; AHgh+Ros34MGPEX2DSTqkCSJWGxdSjDn4DN0cIVrTtxUonv8UPQchCSgSDIMpMy8PG7ahweZ+vTW5Y4t9xVs@vger.kernel.org
X-Gm-Message-State: AFuF++nqV9+/BRlLKP1Qe/PbFYX8T8SCFF6bDiW2ziOPchoINGisKB02
	j3ePz0MqdA/PkZ4Cpkj3tvPkRjkqK6s4OY2CKKSuql3KzZp7pKV0TlGk
X-Gm-Gg: AR+sD10P0d7WXgY7Wtakyc3ePyRAbs5N2L5H5o4zt2ShwQyOXGgrmHD+6WQwOXfryuL
	Qs1wPDv4LGlCbe26RaS40uvPZhzkqcTT588MUeIRQUuU81ojIAlVmP/IF/jjpDY6Z0nxs/mnLpF
	RwX+zGH8pzrQ4OoT1uKk9C1NImNXPSa6Op/+qU4x7N/wXfVy49fjMZnVYf3bNu5uY0HPrlz/5Xs
	/lRv2MONHccWiUaGKQt/uFf6BJIyEvHJpRU0m0KCAH/pPL2j0FcUpcZarim3jeJBn3RlnLEGiAt
	V8CuS7C8Z+iYYjK2pNb4XgAqoGZ250VFfgUPVAw4O+4D+u2uvj71eRKxwC09MVQcG1yTRLtyY5q
	EpeX9ZOf9IJJizsnKAeWANWeKaoo1gNJDz9ypNuV77fDvt+TvpYrtZC/pKARe0O5T7tDYSQwOIv
	CJIUOGj8nPyqn71PLUQy9s7nOFhM6rc0yHgL0VyKXiCPU6gpg7QvfUMa5FCwTXKYKBUquiinIOI
	g4QQt3FZfj7QW1mELqnA2OCVi0K
X-Received: by 2002:a17:90b:1dce:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3966d3e1cfdmr13717327a91.10.1787747133812;
        Wed, 26 Aug 2026 05:25:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5877:641:857b:1318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905c18bsm8457963c88.14.2026.08.26.05.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:25:32 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:25:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Xiaolong Chen <xiaolong.chen@gmail.com>, Yuanbo Ye <yuan-bo.ye@motorola.com>, Tao Hu <taohu@motorola.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adp5588-keys - cache GPIO state before
 registering the gpiochip
Message-ID: <ao7bNPVKN1q4dWOS@google.com>
References: <20260818-adp5588-gpio-cache-v1-1-650a2674fc0d@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818-adp5588-gpio-cache-v1-1-650a2674fc0d@analog.com>

On Tue, Aug 18, 2026 at 06:00:02PM +0200, Alvin Šipraga wrote:
> So as not to clobber any pre-programmed GPIO state in the execution
> of its gpiochip ops, the driver caches things during probe time.
> However, since those ops can be called both during and immediately after
> the call to devm_gpiochip_add_data(), it is imperative that things are
> cached before that. That's not the case right now, so reorder the two
> steps to prevent any clobbering.
> 
> In a conrete example which motivated this change, a bootloader was
> preconfiguring an important GPIO output to HIGH before booting the
> kernel. Linux would then inadvertently set that output to LOW while
> configuring a GPIO hog on a discrete GPIO line within the same 8-bit
> bank (because the cached value was 0=LOW).
> 
> Fixes: ba9f507a1bea ("Input: adp5588-keys - export unused GPIO pins")
> Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>

Applied, thank you.

-- 
Dmitry
