Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3DA330D25
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049572; cv=pass; b=TuF1NvAHvmNhAONWMSr5NFOvX5IExTEMzUcc9iOWZ7uUad4Uhv081TCx0U5J386RCIUjURZV+aHZS5W6OJMi9eBY/R3Cy6o/j1oe/cx/ZUilhNUh411hV1t3Wu0gpMyNmnCwv/5uvukL08/VOcpn8e1ooKEHr/GNrMPLZ719KPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049572; c=relaxed/simple;
	bh=z2MbF46EZ5ucv0Rbn4jpxSOSlpvuR5oe+FtklMkMybI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKvEtooT3sV8tUAe/Y8TwBxKDm7qiEb0NqgZMWNg+eBic34+7oDT7mWPXKucu/7si6k94D8s4tjkW2y+y8CQwQDVIdDrXQwkKpJUJEaQaFww3IAw1sqjcK1yR0CSeVUtFazmb8EcLCn1RxWD8v11E/I/bR5WKf2TkjIAuEzm510=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiyV/7OY; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiyV/7OY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so125758866b.0
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 10:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049569; cv=none;
        d=google.com; s=arc-20260327;
        b=bON3MkuuhSpQ1HqCXP2FUoms6TT9nxb5A2146jTCE0if6kfvKEaH9wpP1ycXOUQuII
         gKqjX2HzWGQwqy6pmivysJyrLDiigKPiYHuoJ/dJgtDxmto205WWTZh+LhezCCusJ+L3
         ofG1WeYwZ8l3AdW1g2+ahkiTav1Zx+TtXoE9gG06JRGMHMOkjw4flP4YrT2cD/pwFwmP
         xLcDVqubfCD5NTPciFtWQQwTbW8f1WTDQdccbhqnlETai7CbpiG0sJvSQEwo/mwo07qr
         5cLnZIR/ebSnWNlhE1UDtT3QJqewlYoHwoHDRO4rj36018jtajTvI5J+FuYNHtrNbqnJ
         a9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        fh=xUUI7ZQMbEk0CFfULhKUaOA5CDnT68q8Wn368gyp3hs=;
        b=AfCGIao6wb596m69c87Qa2yCHNwzkLuT/ge3lFDxLkZyE26kkGbB1XrJMhNSvtTqJs
         U1Pdub8WsI9PetUHqtJuB/Mhk+OjBkb+/XeA3ba2TiBQFkbjTo3SY4g6QqMPdCsUKHWH
         WFI0RZ8fHV+la9dsg9qgjxN75xDmyvhIKBJP/8U/DSRRWhks267ccMteeYqPumDntdDS
         04pGrv9Ln4cak7hw1qsP37787bSo6LS76+6GdFk4G0ris3BD3j9zv8VFddAyhT4T87AA
         ZA/htgM/jBLhmSVYE8wXXorVNucvZSFYzly1pIx8hc4ABX1+uSsDscgeeoaY6YSPTyfu
         /WNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049569; x=1791654369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=XiyV/7OYH8shVFm6i6FYH0R8A9d8hZ7Rl4m6TztQAlnx0bKdSbRygem7TvnYJZgYX/
         /ynQ7u3Ma4YtMGURHOt6KUj8IYbkHN6K79JFmIhsekxUAGye+HDOwtjZUzyFqyIDqz0l
         +40WUAnKAo98LlmObYtDd4gCkZJtyTT+sjEvka5zs3Q6whJOeKi6tCTiUJNzxpDkCpLF
         OeYetQga0XzoAg2C2ZnPyb9wW/PvGfw46ypPh6eBXDp5TIckD8cPeigKqxbXFpM+RKkV
         o+hUPY3PGZBkA7YifT8KMRKMm0J39CkzmbxXzboBlxnE9dqYvQitBtwI63M2+ayKIJA/
         J2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049569; x=1791654369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=22aLMaN03l2QORoufSt/xpHnLr5I/a8JkStUmBwKPId+JuvV/MOEbVbnJp23XJ6ixO
         F2S+YuD324kothNTpEBH70wsHxgp8IOKd3SD1WCsozqsJwIhParmlI0GWNwf1lUeeqzo
         aHM0WdK88jJMNPEuTnb4ueMVqflCONEgkjuSG1t83ZNaZt/Aim3iYbbDvetRj/cJmknh
         qCYrjIUGp/uvq10dejqaLohtWLc0q/ohiFJkFFz/HbbkkMKFAaI83GQXwKR6Ubc0ZxJZ
         9/1vnZN2KI5KWh1bmjCsPD1JTeG9Lq9bayMvDy8ln7Fwt9tBETXTDP834eoGcVtNC+jT
         Z1Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwTrulZwwcN2EbShYKCCrtpWXEeZQ1WSath44TQxi9frwy5uxlP+Ef5oQH6Huzy5RKDJ11ZQRZwD6NI@vger.kernel.org
X-Gm-Message-State: AFq9FYKJauMI6NdOrKH07zBO5XBE4iJfo0bFuSLvixiT5p952kSNwoCS
	tWZf8PW67ghhuviJtyNg4drMUmXlcWzCP0jUTntstQcWf+tZEjmOy//dwhyyKjNFT7qnDnsgajO
	lZFNta6IOhi668wK9IMK06t3WaMNH7CA=
X-Gm-Gg: AYBFou0swRnVnKa7NOFOvEahhCfq+afEHEyZMQFo60gcrEf+BjKuEQohpF4229+CI/q
	YyAeMuU2wmxedD1kK7TXisHf2knUHseSoDhYWzsqWrpUr4q3Fyvz0awkAjfqCuSPF9OO2iAnGI8
	ZPvkXur8K8IRSKihA0gskwFy2KK4lMGDTKbH3/tjXGqR5EYnrZ591vEBX4ufwJ9LFjRdIGli1VQ
	2k3gg3hPhcnhzmVysJCB7fTY25xJs4hHwpqk+HLKFCECv2x3LUD6qS0Lb4ZvVyDtPEcN3cDncqg
	E+mYm8ziqoxJGViLGkB8Eun4QTCx9a0s8K6NzqEdeMGoGg+HV1w+Bgmzn6zTsxp5i9F2sOmbQ1R
	x/PJ3QGNORqIzIHIY6EumgqNGNryiCL2eMkuii3sxxZ498NO2S537TBN7MrvOfhJt8/wGkDIRyZ
	2bPJ5QoKUUiVWhyjHROCpZ0gdwsCQwTtqLtUWiPkJ0
X-Received: by 2002:a17:907:7296:b0:c2e:3ed7:7da6 with SMTP id
 a640c23a62f3a-c2e4ada63f0mr521651166b.25.1791049569085; Sat, 03 Oct 2026
 10:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:45:32 +0300
X-Gm-Features: AclHuK_DTCjZOQTCqmPG6gDQzEj7LZ2x25KMdK3y7HmSttC0mQYSQAXn5_TTUz0
Message-ID: <CAHp75Ve+qpAhf-LcsNnFwyzQU31FmHkxqZGsEMxd-GEUZcEt_g@mail.gmail.com>
Subject: Re: [PATCH 3/9] gpio: mxc: cache compatible checks at probe time
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior. These properties are
> invariant for the lifetime of the device.
>
> Cache them as bool fields (has_pad_wakeup, is_imx8qm) in mxc_gpio_port
> during probe, eliminating repeated device tree string comparisons in
> the suspend/resume hot path.

...

>  {
> -       struct device_node *np =3D port->dev->of_node;
> -
> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> -                                               offset, conf) =3D=3D 0);
> +       if (!port->has_pad_wakeup)
> +               return false;
>
> -       return false;
> +       return (gpiochip_generic_config(&port->gen_gc.gc, offset, conf) =
=3D=3D 0);

Too many parentheses, also the semantic of 0 is not obvious. Better,
for example, this one

  int ret;
  ...
  ret =3D gpiochip_generic_config(...);
  if (ret)
    return false;

  return true;

>  }

--=20
With Best Regards,
Andy Shevchenko
