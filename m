Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794145267;
	b=kEbLN8exO7TVu1eVrEmCkm2NJLg8CeJGJhB4TEyBtpDIuyFQUvlIdLUILSgcOgT/d72o
	 jkP/hWWRMqiWOpA6m9ImJZk+T4eqnmX2FkoCsaRw8ffB2vqIepJIyF+VLjihPBB6NWF8j
	 HdbhRA5o6Svbm91dyhsM3OD7jyaOfrQGuWmIdhalj6d7jh9SVkmybyhv96iAE61G37d78
	 FO1yuUTT6yN8h/9IX0Yc2AEpaxIR3sbDH1RDBFtHPidEmHiQPkqD/gqMWOY605CtdjdWy
	 o3p8ec6yRHFJcEA9BXz8Eu7SiqTQFwnCcxpKx98QI/zypImyvrag/OXvPfDeDgmodVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
	b=zHdK/3ZZ1PoqFZlFTMIxl/t9c6VLyUcjtRRGGBgfYJ1OBrmlVwgfzwY+bCH78ej6L55D
	 FSz5Y7j0IF6J1+g4w3KkOvWd6BCzKfbbv2KYw6wFtGbE6Yf5UnYIPkA6WlGgTEPiEBlT9
	 0/nKIeHPKkW1sXmJEIRyJ99pAdfpYJz+YGTQKEeJiaDlZ1vZ4NQtv7dVfNR7n0cvqNNpf
	 p8EV302kJpqIo4urHrROOrGrNI0M7PqdqmuMuQ2OD+rxdpwawpIk4T/GxnIxKKQL9Z2zc
	 44kitaXtXzyZ0kw8ltEF7GzHd7i/mMwjzn+UMx2XbBZr+8Y4FFi2SDe3cY9d9l+5RLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS4IyV05;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E259606A31C
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 13:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E259606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS4IyV05
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ec20398b05so51919e0c.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 05:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794145266; cv=none;
        d=google.com; s=arc-20260327;
        b=YAN6ptL52EwaF6A+8GO1y6/fVZ+Qeo5aFeNsQkLstcsoKrhVjlVSif4HhDEwGh6966
         IfDrPWBOv51k78Zy80d8n6oXnlpDNsOFnaYP6s6lXrKSFXU/+EQth9OQLMRL2FghBqMx
         CBIFhEuLGSePQIB4rlXv9/06R72FhCVDd2iqV+gixCawmhuylgrt36uF0zJ2BrQw29y8
         xPULOmpAgtN3+AilLfp2HVPQT736nHPabmktqlsOgH0TRa+WAb7FEoJrLej2oxuqqO77
         IHGK5pwHGNDEuWASn0zwci7Wij1BVpoEgK+9u4IOcDWapmLUyHp/qGMCzU7qpm77At4d
         LhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
        fh=axeIY0P9xy/+iESOmzqNtrwVEyZyTZBofAC1SV8ue9w=;
        b=jd61Ji7dsZPjjWeKV5AYi3flYP8l25bWKcDjbEKKHYTHX+tFMqpvqqXoqzenZ64D22
         FdbYN9UmkP9jxb7H/9buzRtty2nxP5kovKSzbhQx4EXb04Wg2yEDCRkyFq5qAAXf8TxL
         +5gsFZTfbNzE75XJTQL286LqaWDVy8TS9p5eRmAs64WzjUN+/rvfFNOyGrb4ruMk082u
         B4bcY8vCUHwB9iV5iVFL2UFD4P1oocNJA9lBUQK4V27Zf75hovmFxU19pTvZ6IMTIOfE
         CFH27C2h1VA/TCuu/o49iAiO7sRSEtHPu38CiKSWXztOuLxro8c8kBe1CoHRAOW+Tpa9
         H5+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794145266; x=1794750066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
        b=gS4IyV05VkDQCzcaj0cH60rzqPOTwC6Ek9YTcFN0sKygzYdNCgqvPCQ+PjGLj+iaOf
         Q49i8VsT53KXbBrEVbHw8jqpLi6ICZGlAi40SrXglC2l0oHF9f7r7Sh40F5tmhr5L0Kp
         TvoLYWozlenwobuTVNR00Mwp41dmm0+/wMs4HJnAIiNhX09lW/0VOL5l7Zzc+pUeBuCB
         gc4bkxR2Xli2wgfF7vqkseoE3XpxzWbNuNOEUCFyVz6YYj+nfoD5DHiRq1I8sIcLfHz9
         XGYsSx4bxvnSz49ljaRWXMOW7wkrHsGJmqpO8QWi/QqUGroAV0QTVRQUlt1v7yzVBofZ
         3RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145266; x=1794750066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
        b=aJ1jYthTPBaHRfbf8NGSPg1zwHCnGbNXA7eqDzzBZzaUpx+uq0WxMixrOVQ8G1XpTh
         SoX2UNwcEPFp561hORdtdHw+TGabwVxs0aq+StKKeUu6rHvi08sJ7E3vocj6GM/EMWr/
         wisB6Hmx3eyhO77ItdRZgYtb9AweIVVtoaKr24DSxFodHkjq9LHmWrt55YYgr/Uls4jZ
         wvE8MRUzYoQjeh3JCBiTujHP8yfH5uh9fdA5KJXcRZeRcmz92Wp+OqHUHXUUUq/pHvmC
         xPndZQQ79an5GtZTBnsRh2ZNaOUMUwUC+rsefF0EZgSNF6kW1utEbO854t+Yt8MSE3eT
         ctMw==
X-Forwarded-Encrypted: i=1; AL+hErGimCpwwr+eEuHHafZBKjhnvyNfMi5e3darsgUQoEiMG96kxX4SvZeIMk6m6JbctOcOXVzgGgIBKOxs@vger.kernel.org
X-Gm-Message-State: APuU4Z/m9owDwLxug66gOwr0IZ/gI1LmEj0UKUQBuBsEO+jh7wBVxqQT
	S6MEHSmvZ67q4TjuwJ3iyWr1Onuv21mGmbdHWKmhlAkRAw0aHhl5fWmGojShhCBa9/z2CaYt10p
	GobPvb5cYddyGQ7sfRz73GGYI7YzNJ5vitvY5ddE=
X-Gm-Gg: AYBFou2e4cl0sHsXQK4Svv2j/kDQOEYnZuyCLnflGGY8KpPQbmtGUTYrAfD54PmQIxZ
	K4oBmBfARiQD2PBjn79xWd4/mM9HAqqyXLDZKkQBcAcjbTXudynSBzDw1p9ZgccNb8vQLVfWZLH
	x9Jq1x80MHX0F78Gj0yg5d+vpuO9o1L6D2eFk5f6YNaoF/tG7JK5Iz2Zf3kqIAv0MNqEcXm4WJk
	aDdh0m6uouGvb9nw3ZJKOo+rEjFNZTfRLrWHXIH7zPG/GQD99PD7/dy8/xUc6oy8f/tOhT1omVM
	1fOEkKjazZZ4lDFhNxAB7QIDMKvAHJmg1eFnouU9fzIqP29XQ08ok1uyR6Mkv1/qHWTTnQu5VJp
	9BLb6aNeDBYHP7sWp/714paLLCT0OcQeCJFP1M2RFI7NXDEYJR/WWr9JSOpUXGQiPy5Y22lUGhr
	LCpA==
X-Received: by 2002:a05:6122:e22f:b0:5ea:9843:fc3e with SMTP id
 71dfb90a1353d-5ece73577e2mr520167e0c.19.1794145265452; Sun, 08 Nov 2026
 05:41:05 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <asNuMzqz3G-gmIiD@google.com> <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
 <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com> <CAGG=3QXRPh=3rYyEHT0kTzDZ4omeHOjmN3OZGy=5hupday7jyg@mail.gmail.com>
In-Reply-To: <CAGG=3QXRPh=3rYyEHT0kTzDZ4omeHOjmN3OZGy=5hupday7jyg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Sun, 8 Nov 2026 05:40:48 -0800
X-Gm-Features: AclHuK99orI-zbieegQi11J3FkK91V4jpIniTiB-SkdXEhfbglSkI_1dZl_-EBU
Message-ID: <CAGG=3QVi4ZrxRPT=9T6jHms3q6n+nTECPn4ybiy3CU7Js_U-Fw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 1:18=E2=80=AFPM Bill Wendling <morbo@google.com> wro=
te:
>
> On Wed, Oct 7, 2026 at 4:19=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> >
> > On Mon, Oct 5, 2026 at 12:26=E2=80=AFPM Bill Wendling <morbo@google.com=
> wrote:
> >
> > > I sent a patch to add `__NO_COUNTED_BY` AND `__NO_COUNTED_BY_PTR`
> > > macros to prevent this. They're similar to `__NO_FORTIFY`.
> > >
> > > https://lore.kernel.org/all/20261005102518.2400984-1-morbo@google.com=
/
> >
> > I see you are hashing this out with the right people, thanks for
> > going the extra mile and fixing this properly!
> >
> Always! :-)
>
> I'll ping this thread once we get the problem solved.
>
Hi Linus,

Kees' patch made it in and the original patch now builds. PTAL.

-bw
