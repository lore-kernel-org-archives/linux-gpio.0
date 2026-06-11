Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2524F3F20FC
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781197550; cv=pass; b=Y+rT+o/yM8d+G/D28zEoVxCKgnMzfmPzx7Ul6PwwA2m0V/7rekndycJNauvYHxVNaysXfiiNi/RPhnZKcNwIvbAojpXMubnrbAbmsAooXHHDKpjdGidzlzpioi9HznVQ59tUVtK8zmYhKMNTXMgGPo2xtmtQYolvNq+wG+UiVTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781197550; c=relaxed/simple;
	bh=7mXpdy0sxxuaP59xoMYRiTZF1ItENdFdjQfhqIGv3aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY4ALNoixmsyTtZxkGcw6sJzO9xGz85VHQCD6yxM8RhpWY2MJ5NNeqE3hzxwkbyyqDQbFUQJxM9zbAXvLsFw2j5/yZls+J1Y4LVo69tyyWAXS/xmOpQHDvmMYmlgsXFOh7JdU9PJoPU6syEg7Xr0DIlBKlw73AXRG+40O6xoDK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeFhI28K; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeFhI28K"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso376685e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781197547; cv=none;
        d=google.com; s=arc-20240605;
        b=PYhDiVm5IuLdiDzq1ahkhPm0yknGRxAUCdVBqIxKrZsYt8wzwjA4tmsVqdvfsVzcm3
         GrQuol1yibM0dbc/ZCsHxoGH0eUQ+ubVAizr5IH1sMUUNJ7piM0UHL27LngxxMhb4YMq
         VcibI8NR/xWx8fv14Y+6uU8FP+KQF2NhFz+CIwVTVsF4sQmtAZlsoGer0D5w5JPn+490
         ANnBGv3Y27R7VZeEC4f+2W6EcUuzHcMyjKFv9cZicIMJHYnzDihpaRN2u2iVVfZE7LZ9
         gtclXSf84rX3BkTmf/VAxzxrrFJpIt1lyL605JoeiZgILbzKCOlnlq3+pd0FMyX2GJSY
         JOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7mXpdy0sxxuaP59xoMYRiTZF1ItENdFdjQfhqIGv3aw=;
        fh=NywMyAcihIeFVmndosjwM22tphcTlxOBxlHYLYIBm6E=;
        b=EaSYofxqkWdPHKx+G3to9YRlfDGjcp76xwtwrUWKuLjlthaU01wVlKS9rcjxguahht
         5AzFFUVbpT9xDrNmZ9warXnHNn3fPpmnDQ+ABHVIn2uDweN9Tz0gmMyCV04wZzIhLPx1
         RiFxPfCQwgis7PKmXTM5kvsb+VhFa7lkYQGrlumfTj+R+gBvDUR8WiWeLvPdKpWSFQGg
         zTzWvwdAyMyIEE0nlQgZ3ZOxLW1xal1F/sf0gTvs2He2m2u8GJ9pRwyxaBb3GGLbkc1z
         eNG6RkJnn4pkaB1ld42Yh9Srm3ww1ynsCA5FeW7PGNFrSmzg7zCIjW5axWdDlzeYnczs
         Wu1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781197547; x=1781802347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mXpdy0sxxuaP59xoMYRiTZF1ItENdFdjQfhqIGv3aw=;
        b=SeFhI28KVD36XhqJDWUGXoyZls9Zhi6/3kwLgX3NcIYxxER211dqN41/qDN0OTiUEw
         uYmS86ToXCm+g/Vn6tmgS42Cqh5SXq7TOAYkIzis77DKFEr4bFEJI/pR0vWfbekFmEuG
         qpAcSQ/vhuhhvjvTDvyT9vlO4vHXqVf4Obx/nISFMUn01sB8mE5arzI9Plja+o146P0E
         Z52l6ytxJyARqNPe/MdFY4RT2QeRQp6tItOwrsi5okTOFN+q70E1Kajg3hbJU2t4vcCs
         78f5B4Tl0Tlhjl9tBLZfXcyqkpHb4VRx7ZVdVoJUdXXjS3p7vJWgWm6GBobDrltbKMyy
         ZCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781197547; x=1781802347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mXpdy0sxxuaP59xoMYRiTZF1ItENdFdjQfhqIGv3aw=;
        b=ho3Tb2neIbByNfRC+E/mFSLs8PJuF9iKzi7Ssjx/rXbHdYvHn74dipGQ85WwzmxF5T
         Ol8JYMjdRHMAslJz3lpRouv6XaLmwS6lLxEGXtZGef/ID1F4GgFPn0RYHLM5x5sLsmbr
         Bg8o6TwRrpBTM1ZL3VOtdicLmtKrh4gZACmRfnsBMZea8nyB1CNvb3PlBcdnuJxQU0zc
         7FW992T3/MinSOHE/dDO517uw8AI2l4UP819ia97x4H72Xlu6Lb7/5zZ+qILAQHqI+LV
         wjlxT4BjYhb06M4C+ZlcIXxSpXmOqsMfSFsh2U8aR4pn/EdquND1jwyro9qGjfCdXMj+
         9uug==
X-Forwarded-Encrypted: i=1; AFNElJ+/qZbXu+LA0e4s2cRByn9bbWsx4Ql7FOVku2S4Q2HLy45ObXnnXXGlIrveoLlWuZmtBrrgUwi9jyQJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhG/mkNOH3GNVlLs8xLnSFxpjPS0ypvK9N6uGTiDeDh60EIJY
	H/HwdfZgQheofiCZ61uaHV9pWa7D2N5j1CT8LXvQhnvq07KtbRH2uaYmBXsNUy+11MGVmrCMD1I
	RkQnnhhrJDje9VNmxnvfS2Kc3SubI6JY=
X-Gm-Gg: Acq92OHRMdpdPkRt6mvl6ZRaE4ThnCUFMYd378BIQBSkY5vvMK4+tLdeGALxvCXVcGx
	yA3QAi4C5Vl8UbI883wzRGZ0TUaVrJITB1d90fZ0hd4V+VprKepklvYs+KmHujeu7HXLSKCTIM/
	NLTGRvNsUaFwQblIEXUhr33zB5wyFEFxyV+3Bwyuqh8xIPIj2PMcZFhBIFrTnnJVtIXGIT9Gtnw
	+JMnUmjVT4jYxBiLqkKU1ICeC/czwgXviW9b81qzi0GdjWmJOoBQ0R1Zsuu3dmE0WGNOSRwNCF+
	gKXVmkDiANzhc4MnhFol
X-Received: by 2002:a05:600c:e54a:10b0:490:e196:6574 with SMTP id
 5b1f17b1804b1-490e55e4defmr38313625e9.13.1781197547227; Thu, 11 Jun 2026
 10:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <ailxCrCYXPkrKqi-@ashevche-desk.local> <CAD++jLkRW+wmf_oFVmmn8bN0ZbS=8vZvV8nWJyy9Zb4O3LP-dg@mail.gmail.com>
 <aircdlL323BTioZE@ashevche-desk.local>
In-Reply-To: <aircdlL323BTioZE@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Fri, 12 Jun 2026 01:05:35 +0800
X-Gm-Features: AVVi8CcCuvHuOrEjAzD4nAE2CmOgsFFgWYgTDgVo9kKZPFkJeVInNneDGGEeH9k
Message-ID: <CANYHO6rUVm=6WQSemJhMoVV5owPAL=4Nw4cFxULaKmq3fG36=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] upboard pinctrl support for device id INTC1055
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 12:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jun 11, 2026 at 02:30:00PM +0200, Linus Walleij wrote:
> > On Wed, Jun 10, 2026 at 4:13=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Jun 10, 2026 at 04:34:22PM +0800, GaryWang wrote:
> > > > Add missing groups and functions in Tigerlake's pinctrl driver for =
INTC1055.
> > > > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12=
", "UP 7000" boards.
> > >
> > > I can take both via Intel pin control tree, just waiting for Mika's a=
nd Linus' acks.
> > > Then I can send PR to Linus to (try to) include this to v7.2-rc2 as i=
t seems close
> > > enough to the category of adding new HW support without breaking anyt=
hing else.
> >
> > Excellent, thanks.
> > Acked-by: Linus Walleij< linusw@kernel.org>
>
> Thanks! I consider that for both patches. Gary, please send a v2 with all=
 tags
> and elaborated commit messages and cover letter to address Mika's questio=
ns and
> concerns.
>
yeah, no problem to send patch V2 ASAP.
> --
> With Best Regards,
> Andy Shevchenko
>
>
