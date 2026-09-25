Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FCD4756BA
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324919; cv=pass; b=qgao82LbVRQoE0rvzFENz7NutLq7a+Itx61Aw7GLwwsJ6q9acvik+uwUzG7Tc+VNvlCfjaEtOf+9bAt/DX5myarEkzyGht/XDs+m/feIUe4VHO0pWqLMYwxno9KmPiRVDX/CTrhgLrB9bN08hrHNWYfo2yaMgbEFU3qfnZKCoTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324919; c=relaxed/simple;
	bh=EQbxlDZ2Pxmd04MLVhgPkCvPnuaf/4pa06BQ8C5/Jzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbcmEt7Atv7jO7CgQtC6srhrUsK/MjDxw6u6tbcRirV94KbGJtfBZ2mDfIKmAkt933HC5IDdA0GCJM+Z5awAp4atbQNeY1RgKwdfJD8UfZp3sDBnfMPj8wq0OiGH57YBDLk6KARuUNLSdDQ8A7465Bau3CXL4qwZdgWUoIYm80E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPyh4q8z; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPyh4q8z"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c264788fd58so88019966b.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 01:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790324913; cv=none;
        d=google.com; s=arc-20260327;
        b=qI5jUyITzZwJy1BYvdj0H6skM/DC9SkqlSaS05dksH8nf8NhetqNSVjvA+z7NoMzEV
         HsPSFNbkWGODTAg3+KWWqxNB5ZsqPy7ZRVZ9aTCYoCnBVX2Btxeq9MpW8G8RECroGwKx
         zYkowjt2wg5KtcxgDttNfSdiQZPbgrkODF+nv4w6JK/Gn0NSUBhfdHyo7AEcJVOQxshD
         f+yakBFobThcH+Tt3o/E66qS4eN5f5iWNAFeRCMvNTlJABfC+UeGQGlgO+oEVnGEF6xi
         rPYbK/OpNpWc+a/lZn2Qwv/OT8k2b2oKFdDVZARRJQHHDfd9C2OT+qnff72RX1rRsbc4
         ZZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1gcwgKHE2o/eF0p/9qzOmI8efuyhVZE8JJPzxDfjp8=;
        fh=+UDF6oHGYkrOGZZKEeruB/PknVgnMFohtlrJwJIt9u0=;
        b=XEKtKgNjQvlH1o3i+NX5IqqraOyIzUiyyd2MxXeWq/KOSvB2Ti1EHwnDfR2WtwgEp0
         0MEaE9cFc4LpyW2NpcbNbx3/kKTlV60cNN0TDpCy0B/KqVG2FQU9ikuFNz58UyPMSGR/
         KJHTTG3ib/17ZjgJbDHWdmJ1wu4hhNeaSe3Nasw8uXkGE9ONUjUiAY+2Au65VoTAfDFz
         xpwO94y+Knvd5C+T2KBZ1+Xsl7Bm9xkqgDlouFIbWA4RptMkE956tzTzcWveVldv97XC
         x2zFOoABXuh1hzZWsRXnPp9ccEH0POQmeuN34Brw6Upvcnlf09ZExR8VRpXcgdARSSQb
         jfsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790324913; x=1790929713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1gcwgKHE2o/eF0p/9qzOmI8efuyhVZE8JJPzxDfjp8=;
        b=BPyh4q8zm+qh21MHmAltAxjEbQc3TRxffCY0i8f4SlcQN7ERJO7rbi6ssBhmkUU+Zv
         8lr1UeKxp2kCYHBZlpBX+g62wEK+rOFX0HV8fIUWYALzvDXRAoCBd7WSYE9PsuK6l9pB
         ii8MO+XPdYup94SgEsWh20CixrkPKaYQzrTvY5qkiRMSswNPUUH5chk874kD06tlbdMd
         2L2ESwAspow0XI/nKUxZsjTOQAwM7JFuI5e3tA0D2nmLbROP+3bAWZ6+5mXkti7XNjs8
         h9ny0kCKmwE6TbN/pKEMAAZWMMAWbKazCefmrqXdpjPVwCVJd8i7zHWia5g+b3eZvLao
         Jf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324913; x=1790929713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1gcwgKHE2o/eF0p/9qzOmI8efuyhVZE8JJPzxDfjp8=;
        b=FIjrZ75pVNqCWGzZNLteyzdrqKXW/8w8mTMLGRENhJxE1pg3gatLW7M8KSjvqzycWv
         9PUYomRbq3Kyk8CViK28b6mPFbCyO3XpL6uRcVHfffR17uXUV/fYO94Bh4SFVkH8da2G
         bopzZyRvik84PCFMbUfu47YgVAuEehnbZ/gZJO8y4tWEfaGT1Fj7D1mL1peEKO6b2qtQ
         zASGMrmrULKH6sxhCw0h5jWIYMj3IPg+u9TAq62abEjp58cKs/GQv9QHIccb88F+Th/x
         p/kmkHyH1tT+Fa22djN5EDjo6WzhHCKgTtmi+oubofH6C3oBs1OujppIqNQTYQ3HbRpl
         n+0w==
X-Forwarded-Encrypted: i=1; AKwUvBxY4A60D51M3Si+3wT6fa+Muf4NBhmow9TrGaN/BIgEfme7/dhUP30VXII1sW3Zss8DdWrw1ecMZtMD@vger.kernel.org
X-Gm-Message-State: AFuF++kGraNU1q6GpNMeBCAgRj18dYm85PkfoD+E/nPnVLx2NBQwqKlD
	ty06OqP3zNoKozwn8hkcpswR1FNWw2v8NiFQHdE0MA6mIK2GtRIOkTSc2epK1crlo73ROK2ZNrw
	avDNxQ07RNGSKAO/f2F0EfMbC3qRyRzk=
X-Gm-Gg: AYBFou1tAL7CPclGyrBzr5HQDgSXjDd6zLQAcB1G0yEH/pe5AyxIenJCpVJjZwrzGUw
	BGHfsGU+SoJYcfh+QVfBmjHwN163LXw7q4pA9mDkRRDx66b1FSMQZ7O02CL1MOUMvJpwUXj/srv
	1VfwfH8W1mJJ1T/2dhTra/0E+8z2rayht8DBFzd0SonhCv9qoM1P73TpALq8m64d7SWpiISUrlv
	7fqK5iD7jdSTATtAdAWKgsArN5UM/edmhxM3xGxGgB7JSXfAhLZqNwl/yp/uW1gPnrnxrOvMXaG
	WGRoP2uEAy5LKOzO8rHRQWM8stAwpd6MLxvxZ1OyIDTrAYEY4amiv4vH///R0PGZD2zu/Y+mu65
	LmPldKtwefMqUbzY2n4i5jqpOpvMajW65hvVUORqe4/mSBj3LXbfBpE2a5oi4riMxrhf6ZFyNg5
	4Po1p2OiHx7NgxhKmZamgy0hGBQ+NSaEh4AZhY0WJw
X-Received: by 2002:a17:906:9f91:b0:c2a:8cd4:cf36 with SMTP id
 a640c23a62f3a-c2ae9f6a802mr113044466b.34.1790324913122; Fri, 25 Sep 2026
 01:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924083512.461838-1-peng.fan@oss.nxp.com> <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
In-Reply-To: <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Sep 2026 11:27:55 +0300
X-Gm-Features: AclHuK9v8ThjxwkXmKFN9Q8U5cIPNT79Q4CGnC9umBYE0HzIKSyDvA5ZTne3z2k
Message-ID: <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional set/clear
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andy@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
> > Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> > the simpler regmap_assign_bits() call.
>
> Applied, thanks!
>
> [1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
>       https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1bdeaa=
a85

Are you going to handle all the Intel GPIO drivers that have a
MAINTAINERS record?

--=20
With Best Regards,
Andy Shevchenko
