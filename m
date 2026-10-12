Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E946EF7C
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796569; cv=pass; b=kw3UQA/23HeZL7zrueYFD1RjRugSC/q+84yZ0QbErJhi1Bcma/7Rfw8kZFS602zqslEUFjMTAp+Y4LMIW5i5toEKRy8cbFKveJyd5hXhxcMJqRspqXSnrQqlLCKmzT7nrNpz9hC2tmmc2DE7chY343ZC5nyNEfpPTu7M43dpS04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796569; c=relaxed/simple;
	bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0MTHbO8IfzF47148qLYUzWuN09+Sba1ZqoR7t6lUZ/dCdDqCFBalRN6HT64k8nTDK++WirDYZ7Z/DL6Z69aazuqPBcZHeeZU86cxsR+FrA27lwDCvXtzFVkQtvAuGF8Kbe6f1grdpwa1903zaxe1Gb9q9lRnnPM6pngUy/Q+ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1QSJswy; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1QSJswy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c315869241fso236392366b.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796566; cv=none;
        d=google.com; s=arc-20260327;
        b=DOPXEpsT+69nRVwMmTZg6oxN4UNYuhjIfa3oTOaJiAccq3y0tjFN7aFH34T4XqvKZW
         mV5MHotwIcAjmmLIgc31Y4hRliW2ZTp+rU6xNHcwg1RXcE1J69/buvRLkpmFHzTRDwBe
         tHRWCmuB2/UkOCFL5+DerTU/VpJY0PTqGQE+KLpbijjqHd1Qszm50x0BCe3/KVbSONPb
         /eHlF+WvOuyR8N9ck0M5X3ZazJHMzfOyJ8XfLFcQRESlE5aQkExYkt39+/BCtDLNT3+P
         uSOPDt/dJWD5tIxtpkaEsehr/Q6erR3rDMuqspaX5XJVEYQcTNitinjHhioumGmkf5Ew
         3L6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        fh=w5MIQCPLEhjrXfHnQ4HUrSh/8nuIPGeYJTirNsciSdE=;
        b=oJbSSyBrOReo5S8hfHw15daPq0bHbp0I1Gf1pIAVdfXVFnNDrCSYFIJwpu7ZJojkd+
         uRHMAypj23DU+PgeAFnMS/ajFGKcxk5B9CWx0oLgub5wFDFzYhh3YI7xswNhKNxmzLpY
         gzSckJL7lXfx7RYD+JaxW80nHq20dnJjMWX7ZcxTKIEC+5VgzyrImN7pUT0UhaC9ahbf
         yrP+veXjsYcBveeDUeKXbdgxx/PrczrlodJdxbSgoyCU0HDnqF/OKNOAphmkXGpQxM2e
         Smr4t7j99Iv/x+VVZxcnQn62M+hXLbhs9e4edj0bQ7YBbPmWKmEPReGH3nejHAJKDIvk
         CmqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796566; x=1792401366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        b=N1QSJswyp5sWme0XW6RXjdxvsHXNVC1zjC+lWQqA6tmTDv4+ygjyjxIBwy0/NRnLf8
         9dDNDBKh6Lyb7vnHnamVVe/a4ZFj2ypFfKPobbCdwgP/wnjGOm+A4h7T1jEs9e+nbwcr
         eMElEBKO9nkNl7Ep7K0qK1laDe/VNUuuO9HrGBrmHWuH/JzpwgrZmsVhXqkJSm118lRr
         4p6NvCSqy5uWR4dP7m0wOKTOoO3D47Q3R4cBCqVAQCP7FdTFbfa4bnd0WkZifg8sueQO
         7rp086GUnFulB3Y7G7H0nl9GvjJUji2pHpqwK5RWxKyUTsF4khKJOQ2SPDSG4xtQ0/Km
         SXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796566; x=1792401366;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        b=KYdMS6X5NCOS0An3kekenFEA0cbMJYdIjgT5utq44RHNqgcxzpawafjf44J6JdE3BT
         cZvtPlvy1bopIy/EQyRcyJ7VgKQ1hziIsgHY0uITU96/Q9miQwMVJAKbuL1ApVYwwDG/
         fa2U3v2DVBtoML36cl518HX4I1lERpE/iTYIGdRn7XNWJ4aswid9/CVbx0mzTyxbNDLY
         l2jmq/YTJeg522hg7NZCIuTfwld9LCbn5RPE3fhO6oCdJgcqzVskSI1K5UdZtEyZ1vbQ
         as9KMpgaQh+6w+8Fn8qGpTvKFiMC9Cf+6k5y4o5VFl8LMg2SLxdt3mz78LXf87q+Pwyh
         TQ9g==
X-Forwarded-Encrypted: i=1; AKwUvByqKrG2dgPHK2JGIVe2f520Tyoy7imCZYFWo7gUXxJWUgCZR7M0E95YdKDN6xTwwW1q0jG/iloYSEwR@vger.kernel.org
X-Gm-Message-State: AFq9FYK0TMC0C3ouZYAwJ3xHuRlRqq/VdR46bYCnOH4lD1pBrsWtPwWv
	jqLIqwF0MVQ+VbrsGvEFDfP7YY8pMk3WFkm1QXs4iJ5TCpGK+PsMdFMVmnK1DCummJBWdyNK8pU
	0oi9HzmFDnu2Y7HWRjQJFNsUJF/BCYtM=
X-Gm-Gg: AYBFou2UxyAlYTidhirhD2X6Qre6TqoHg62dj4kSMK6EpikyO2l60jbFhlBrBE8xJM6
	+Sbrztm43kUc7Ii8Uq6vqGJ8wrsR9OpsOF8awCZuiCgSQle8Y0VkEK2qYUq9zMTNNmi4TtYTjhz
	BbQtS7qBfkp8MaznTDREZPD+dRC22DYXz1aMML+f2FbTq6VMdmU21BouCFn+AjDT/am5sSCYa1P
	Eo39BkKdwib5TH4bOA+9EhvlnL8l76Hb+OmX85Ksm4hoOPVeohdXqeteuWNtzNte0i+1jv4gOCc
	Jdf9rBdNoC22djOCql3h4FJBq//7eU4mru0dGXVblqetejx2ZXy59LcYioc74qi+pIT2UHXbcB3
	okaIZbdfFp/DNPJdSzE5Wvpx7Ffo4ue6VXHyjmXXVU/6z34CpnsqZd75/hIwhPYMNkNDZNqsbxn
	nB+3yU5pVYtEna3+MN5cmwcDvbx3IRuRsSj2KCXOox
X-Received: by 2002:a17:906:7948:b0:c29:60b7:3f14 with SMTP id
 a640c23a62f3a-c31aa02b449mr838815766b.46.1791796566369; Mon, 12 Oct 2026
 02:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:15:28 +0300
X-Gm-Features: AclHuK973sM-FWRDdJi0fSTDjgQG7reB3UnWpT5L7Xl9I9NH2wEexbwNU5tVEtc
Message-ID: <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so use atomic bitops when modifying wakeup_pads.

The code doesn't modify any reader part of this member. So, the above
paragraph is incorrect, right? Otherwise it needs to be clarified how
assign_bit() does change anything.

> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And fix the enable/disable path unconditionally sets/clears the
> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> Only update the bit on success.

--=20
With Best Regards,
Andy Shevchenko
