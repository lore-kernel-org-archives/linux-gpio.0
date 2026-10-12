Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B995E4483B9
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796793; cv=pass; b=Z5JVJebLl6Y6NLx0uSi5NhEOTRwxaj1meSzsYYIZbVIvx6SFqSmxgryhKijAjuadYC0lmJaedub5kuUIiVyvBvxDe0oSxKAaj3DoalPUsXaJW7nc4tRvZXtfkTWpQk1KaKSikbWHuozugEK9dIsgd5XTIe3eyLh2VIQCZ8asaL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796793; c=relaxed/simple;
	bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDA5OyluIxX27hIW2C9e+lVIjWGMikd1nXMlU9G9YheMZWcIEeeF/aBN/o2mCErAcPjr3YWJelPQ8aNut5EjnaxRbbC8qu26BjAmh9LFrOVxglkqWq667eKc+vSFY993PkV2DnjtZfwT5k+41z8gmXdl36K58+WEXpxaIxAoC4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GToq8iRH; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GToq8iRH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1828294a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796790; cv=none;
        d=google.com; s=arc-20260327;
        b=rI9nlQhhMZBb5d5XVYbYT/gcEkJeRL1sPa27r5wWh37OG2zEDv4LEYbxcfAdLB72AM
         ESntYakak569Z8VUPTRALT2Zn7N7VZf0g0GTVsor6vS3jHn+tIKRf8LgQpoeW9tRLr6l
         ILJGEcBj51KVrmSAfdU9k9V+CpRCmZDW6wrOv4Y2NSwBOVB1QAxojQwARMUWVCoj71mZ
         hrsinScsvs96vpnt29tNNrLbv459l2qtRzhkTQCgPF6DtihRp8UzSj51P9DabYFR1zdN
         brru7jvHHCfp5ovzDNY7dlYu+Ac/ydtaPP6exhI+P8LBcI8aYOYrQdITd50rz9A/le/2
         mzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        fh=81YWspa3+UZZmnwhUhSVagr7F6xpAqCJcrMK/3O7zOs=;
        b=anA+7a2/cm1vnrig4XC6Hs5PpxUcVYn4+F2I1fb4OrfE43824pR/RkH+CN89c7PKrm
         ycMT/ZrA40iYIvmx7XcjP9/KRNV8uDXcnSvBADvtuhADClhjPB072uDPGpWnCwIilZls
         vUfO0TDzpZBkH3QpFPIrNENZD1i+WoEW6dQLQO/0r51ArGceyusmPlvepzRX86kIXcqF
         hNs9qchR7MHzb6zd2eGtmJ8CMWlPO9B6hZ5F8VFRqtE8aUtuYk+AffbAh8EOlRBh4Ck4
         XLhHLtbddUnV2GYkYqUvRqGBrtPrSZ3zWflr2MQrpLS7TZiKQAjH2a0qiLAt5CcbvZRr
         swXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796790; x=1792401590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=GToq8iRHnVvIYGlaMQ3xj8dhUT/k8baLJSbWj+DvN2L7REJP+azoGVIZoVJiwas9cq
         HjptXwPv21aUn9wxlKEl9x9pfHRat8+to4qymSW6b1El7M5jSbEX26aFPkDzHeqdwsBa
         4Oc+qujWNXaZXowCqzwgWzxP/fG+yauJ9dPn8ceuDs+acuT3KoBFna2wZAlYNTGV8zWB
         vhv0BufrIMecOcZX4CNPLKOk3Bdxza/2wu5pewgfMJETM29KG2ygrKAFOsV4e1JDwpwe
         1Q31YYNftRTALmHxEtWL9lxsWNPL4JHUHtzdMq+BZabnie8cz0AwMjyKX4NGbwLMJYje
         u7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796790; x=1792401590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=jTn02demgc9Ln6V4BYXgGheBFYFdhKIodxRwlvJT4xOz9eww5fi/4Dc9FKl+j8qC+I
         uc2AUBx1qDMeVOX4oIbv3uxJqeTXg3dQFWb8l3n0IWyvuj05t08TX8tCGfdT8JHP/Ma1
         gr6dd5lV1ordgr4iR9IuBGMUtZTUULKo3cbCCN3JJu0Honn+uPdiZzxfInAnDw5xkZzJ
         JFeBaJ0Di0iUKqL2OIlpeYGjBu8k72b4lsuS+qhqBzwcr/6RjEF6QXYdpJyp5SZtRtQV
         KjdU1ZVYO1vAXpHHXrntclYCeeF8/iV9VqwT+V/HZEJ3/jalLerAI4gPMKUfPbRrzsFp
         Canw==
X-Forwarded-Encrypted: i=1; AKwUvByc+irWdi/Vbs8DjECorC88YEtxX4RQ8T3rw/sKYq4dw8k3mBcDzuogGbLXz9kKRoIXE7rp14E5w9Ty@vger.kernel.org
X-Gm-Message-State: AFq9FYLwKfDW9qJa0r7/3kQTBDjnMol6fUaFrc+tE1if+52elU0H2xEg
	ihpDx5DreHIBfOHOMm96g0cPUgofOu6Bp+7JefgLRpbWTshIsPZlcvjLkI9tC5Ye5iRCvpfc4KA
	+GOb1i3k23sKj/2/MqG9DLD6HIy9cRP0=
X-Gm-Gg: AYBFou1Jlzw6ujXHLdBHliZtsbdejZsCRa0FnAVn/8xHC6Mox2Lo917Wt5FS5TumZdb
	Soio9usu5e7+iKVov8TdaLh/Z3TfIn+hohscHBo4zyD1LbYxDn4jOlZEoxZiixU4IkjPWx56Ar8
	kw26qOMDGgS/MZRVTeYqhM9eLDplcCwXaLRSXVM4yE2dal30QExPsTORlVYiUEsWOEmVFVw7ZK8
	b2C+aikd5T/NWnH7EVqpkIDrp1zuGeg7V6bFeUatEsb4xJuvxSWKwaMpI8HAaRi2/ulz5RI/nds
	7C/oq55WKdqxrWqgUnzJ/tFCnNuIpsWGKf5BAU5RvColVyu+TOu7pFp7RoCEs6HZfXMbEJ5j2RD
	iar3O4wwtFdAf+1c2znAJyrY8w+jr4HV2DWP9vkdKmpGLxkcnOg0mTyYRur6Q9r+f1HKHeunDfn
	dWk0+YlpQ/szvcysNoky2nw5VBggQwqZdffqBiQUL7
X-Received: by 2002:a17:907:c317:b0:c2e:2ef8:5585 with SMTP id
 a640c23a62f3a-c31a9b0af08mr839361166b.9.1791796789636; Mon, 12 Oct 2026
 02:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:19:13 +0300
X-Gm-Features: AclHuK-_ERRyTh4kZLrDH4khT6vrVC8RPJd3Q28g6NygjNOEZR5lX3Usk0n4iPI
Message-ID: <CAHp75VdsxjdbrvjmFS0R0wzFV1pge1L-bfqmA5dwWD=o1Z81LA@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
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
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.

Suggested-by?

--=20
With Best Regards,
Andy Shevchenko
