Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5065B21A
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694626; cv=pass; b=SzYNtx27yXcbvS5/4tSdo0R4t/jAbvb5RNwupJGF1zEvH/OoOaBD1eBnTFE9/d2tiCwtXYQdyYEEz5cIJ/OuV5spK3vvKpfEEBZX0ZQtfTGaofY8/ybIscfCNXrevzjWjDhMxZmYrRI3UMTSpLnw95FD7lGbYIDn7W4zEazzbsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694626; c=relaxed/simple;
	bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsopprhmRUminx4EDF5VjIRYjAto4cg/3+7czRFgE0kFxMVrW+XtJOVTetkN1OEOC3502/si/U1TdVkZL0xu6Qy653T/GJW8OZ7fmk8bYKyoN5+K1GQ8SJrRicfB0+Awq+PrgLoo2Ag5j6zs600foZA5syl3hHE7Bt/aBY4dQ0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIPeWEBg; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIPeWEBg"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c996fd607so72487866b.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 08:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790694598; cv=none;
        d=google.com; s=arc-20260327;
        b=pyvcKC/ZMGAYkBmjiKjNSvyETVRXTnhRhQlzHGHEGvvTBu5s+/zc2+TuRRZGz321B4
         7TTmfNank4AQxdXnxmjobNJaEeqjy0CTeYnl3hUBgCk2PYgXbJTxc/kCbdwLlM2DLcmx
         CZdgllQPpTPE7wrA0BLIuup9ZRGs8bT9t0UgyjCkqhNScT9YfSPv8ZQeTy3vUnshS5nL
         JXBFlSeXfLbIfEZhCY6uTQfGx6wWFtrEm7kvdfk16S8DiFd5jjQ5I1aAjlmjxJysNW/8
         3KxFnVniF9fzJEOvmp6j5BZb85OqdXRFwlaAc26XDfGfcgRWCF0AA+zvEGXQ/fjd8zO9
         uaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
        fh=gyyS9Sv6lWDtHph6JMg0ZDzFGLgAVwmiN7Soljld4ao=;
        b=PsOuP4OWmOM6GTr7nzKK4E/2yU7qObHT2+ZuiY5f4RD2FF7LWOZHaMArVp933ifj2R
         j9aQC/BUgjPcgReXesYtNp6z3j2kp5ukODVOF4HokRtejlq8/MPf7rNfxVLqsHKPfpsq
         931JfbepLR9aPQxDkkDBKYILck4B0W3/Djz9cxUJd5rkHa8J+lI0Pv1+AJ06WJfMyPRe
         nb4mmRwN3XKkIZnKh+paHHVbvvDf8Fg+FqzjZs1PjJOcw/tBBH45EGZW5ZPb8mJVjBHK
         5nsowQ61ge3CA2++MMrAyAUloaX2kSTv+bTWRtC/HcBCFUWzljJ+bnJguD8tMFtABNho
         zH+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694598; x=1791299398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
        b=aIPeWEBgP286Rd74WS1MS0k2k0axHU93D4S5YwQ35ftA0rS8n8niYzEr9Va7j0q9AZ
         OakfyR80ILYi4aCN6Cxlu0rtkzbhtQqWfRxStVcJ6pjO5y8D0UPNL85Rr9VBawj8lBKu
         tJYiOhL1SO1MM72rX+m2i03YIEV9Th1EovuWubYPZwTfhvXuTJJBG1BbAN3/YWxYsIvK
         PxANBhrfcHJUMATdJ8JPMp3NRVFuLoXshj4MSlNzrzsGaKVpPEHtSfk+QYww6P3x3I7X
         rGWBwM5cvQQy7MY0Tl32ThOaHCaOHMhzcQJRs+ZqJJF+UcZz7jKmui5yrlh/2y0Eqtus
         v6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694598; x=1791299398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3DvdwcY+Aj9mC4dwD/O+q+VkKRKDWBtvDCaqA4joz8=;
        b=eeorjloD6TUdDMH8s8gH0YCCLwHA7Pkg+bkOARTxTclW9gYLnjN6NuYCI9aaw2QPvL
         ULfG0QoShs+dB3A4gDoxrNa2kA+kX6/Yh5+hgnHRyK3fnWn4a1oafro3nYG+Rq3xfFB+
         G2JgqPgc53s73RLEGbVQrPDjqqr+LJd7eB5h5JOxEBPuAzttXO+Ibwp94HilwYnUsZRL
         uvY90sLfhdkC+PtJPs9VaAkBAGrfRhTl3471HySfZKj9xOxrP3GWuMqTIVX01iiHPd9w
         OKURvTbGsBsvBRpPnRPWFhv4g4IoqNE439v72flBqpUGKjnj6TrEtojZ5gfjGcHoy6xA
         pCLg==
X-Forwarded-Encrypted: i=1; AKwUvByCqgH7XStBmWFMmrIiEl6lCaJ3cTaliXSmQzOtGo2RfOhRueZX1BSWC7mogX5P74PsRVVaGPfLkVBg@vger.kernel.org
X-Gm-Message-State: AFuF++mQoc5gyGLTVudMWfVEq/ALRM/LTBPdzdgK4Yg40fROwoxXCG8+
	qM5S3Ab9OYl/8ZvIMnxXR0Il2f+yBLvvlc8YnaEMudox3WpO8ar00L8rML+utfP8pgcNE1e4Ivs
	ehHTXwdB/iuuaqPAaLv/MFMiJyXQ/sRpkcdcb8R0=
X-Gm-Gg: AYBFou1cZNF7f6QiUA2uZLJGjtqB4TLvLTQhbLWEFl7Rrljr/FJ3whkP+zA+IgkeE6B
	0AEo6rrM4OcpNuQxWyGNcL6QdyEwn07OcRfv+ea/9/ggsVmrO7bp69bCFDvhKtauD2Vf2v7TS0/
	puAbLeQXTJpf3kzTYmUCDdoWGRtYbF/tII1gm1St72yTzC6bE9cV6scJnHlTPKDhvWqak+5C4z6
	10jIes3t5Ev/g6uFY5FE+kf9kD4ZrkA5SmnVWabeHJ5rCcPveffu0pptsfQAkJLZlXmtJkyz1fn
	F1TGBJAn0PQGgYvtZztnEhYeswIm6AoX8r52Mm9uEXD96LlzbtA5Yxeb+bVTvByvU2BPsywB20A
	UiXJDwmZ2GiipO8LmF0i437X3DvWzv9FS0LB/tlzOe2+emkbum45RvcIMk/wzHoibsWS5CXPhNg
	gWrVgbJcWoLDvDRgxpSYNOBp+CUC+3hdsjEtjD0Tug
X-Received: by 2002:a17:907:7b91:b0:c25:f7db:4be9 with SMTP id
 a640c23a62f3a-c2df4bbd66emr249698566b.15.1790694597369; Tue, 29 Sep 2026
 08:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <20260928123446.GH106095@black.igk.intel.com> <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
 <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
 <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
 <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com> <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
In-Reply-To: <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 18:09:20 +0300
X-Gm-Features: AclHuK_ig44-8Lba6xzn4qrUSgfy0bItWFvk8zB9-j3BWSCRSS_99NXNM3MtxkQ
Message-ID: <CAHp75VcpK-Kv2tfR+fAuTWE15b2j34M8X+_UEkBGz_V=QJPbEA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Tue, Sep 29, 2026 at 3:31=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

> > > > Just send it now, in any case my series is blocked as I have not se=
en
> > > > a consensus on what to do. Or do we? Bart, Sakari?
> > >
> > > If I didn't make myself clear: I would love it if there was a single =
source
> > > of intel GPIO pull-requests (most likely Andy) for *all* intel GPIO d=
rivers
> > > even if they have additional reviewers. I'd also love for them to liv=
e in
> > > a single subdirectory at drivers/gpio/intel/. Otherwise, it's still c=
haos like
> > > right now, just worse.
> > >
> > > This is in line with pinctrl vendor directories. I also don't see a r=
eason for
> > > moving Kconfig options into their own vendor submenus if we keep the =
top-level
> > > entries sorted by driver type.
> >
> > So, as of now it doesn't seem like an agreement among all parties. My
> > opinion is that it's good to have PMIC be separated from the other
> > code, although I don't know if the camera PMIC GPIO driver that is
> > used with IPUx is good to go under the intel/pmic subfolder. I also
> > believe that camera related drivers are the best to be handled by the
> > media tree (as it's done, exempli gratia, for int3472).
> >
> > At the end of the day you will have a single PR from me, but it won't
> > include camera stuff unless Sakari agrees to send a PR to me (which I
> > think won't be the case).
>
> I thought we agreed usbio would be moved out of drivers/gpio/ and into
> media? That leaves intel/pmic as the only subdirectory IIUC.

Hmm... I cited the int3472 MAINTAINERS record to point exactly on the
variant where it's left under drivers/gpio. Also IIUC Hans' opinion is
that GPIO drivers even being USB GPIO expanders for camera are still
GPIOs.


--=20
With Best Regards,
Andy Shevchenko
