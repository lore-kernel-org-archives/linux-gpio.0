Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ECB37F735
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141335; cv=none; b=k6JaSvCZ/LFahlBWa1ljDICWeWLMKld0G4u+AVu9LqLcT/rl1zuDRI/KcLMhEF1bJNUHWwLDlyESRjQTUg6G/tMbQWuoOcFhqut07jDuWcnehA2GYE7BEMQu2oYbQvPBiaZOjA1fGsyw+4LtlbcaLLKsrKbv8QFKn5bAZn8qwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141335; c=relaxed/simple;
	bh=eOps8TEcAjAF4fVwBR5xFTjIImrCuU78zcWSRFmuzYg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXr0ef+dMZb1fL8o0pUN+q1BoUkebKWeb9k9f2Rh7/5Xlb2PeagXZXJws4VdrtO40XDbLvB6N/LNF9EgYyGb+wmwsr7QI+/PXZMzqIZP7eXWwqWDaTmKRnkknO8CfnLQBwACTI+tAzkQrXz0OdSkcv4zFzmwD8CHmhLiiY2jCAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqy6APdn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqy6APdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D0A1F000CB
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141334;
	bh=eOps8TEcAjAF4fVwBR5xFTjIImrCuU78zcWSRFmuzYg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gqy6APdnakNJ8vj0NvfH3lFT23A0m4fSr1JOz3yP1WoY872Kix5jqWA1ZCTtyiNyG
	 Nj1TIV3UwTK6LMno6jRs15TvM2tNmEYliG03Ho6hWvmqoSWCFOzFG0OS41Peky4e8x
	 aCXjhcW2P8sYduoLpPFqlwgy3xXtudmv1A7mQq6Tkf5b7fYhfMvNguFdaz0IDDEJGC
	 f+wERjadiiuoMI43tuNX2xEFA6ZDjeiYuLjKCH+DiosKSTV122ld9/3MCOLDjz5dYn
	 u7tI38nktEbRkBGZcnFFDsCWRXfTg4zUxCLx8HbBfPpUz1JQcEBvyVQ0a3A5qbWORC
	 QCJX7+ZAge+jg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso854955e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 02:02:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlTOts7CmwsVLcdlrOswjA6Y3ysgRrV43tQg5jwOEL5BkeJ5rAqK8JhqLUwBeR72Z8ObTPkD3SHAoe@vger.kernel.org
X-Gm-Message-State: AFq9FYIi9irS2Qh5WJtxqU5fhL/wPNz2TCMyLoseSxbvupk49wHvX9nT
	sS3+/aYB7Sjm6jPaudH1CrkqQuVZVkHiM/EMBJFEenst1R9vafmOhbmZUSUl+d9Y3BzA6X47lFw
	EmiMEjNF/XM4Edmp71Z75XnUt8lVTVVazVf3DBjVY1A==
X-Received: by 2002:a05:6512:1281:b0:5bc:ec72:4edf with SMTP id
 2adb3069b0e04-5be475c279dmr881533e87.11.1792141332643; Fri, 16 Oct 2026
 02:02:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 05:02:11 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 05:02:11 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261016052602.GU176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007120944.1705014-1-abduvaliy.hbai@gmail.com> <20261016052602.GU176164@black.igk.intel.com>
Date: Fri, 16 Oct 2026 05:02:11 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdgwgA_h0mHzQ_Jd4hQYe0Z_zFWYE+T441Cc_kCRLFAbw@mail.gmail.com>
X-Gm-Features: AclHuK9XlRqP8JQi1UUbszfSw3iq5yqO7rBpRtzc4klSoojWaTN54G9nP2vb4-g
Message-ID: <CAMRc=MdgwgA_h0mHzQ_Jd4hQYe0Z_zFWYE+T441Cc_kCRLFAbw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S AI
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	Trijan Koju <trijankoju11@gmail.com>, Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 07:26:02 +0200, Mika Westerberg
<mika.westerberg@linux.intel.com> said:
> On Wed, Oct 07, 2026 at 05:09:44PM +0500, Abduvaliy Abdulazizov wrote:
>> The Acer Nitro 16S AI (AN16S-61) has the same problem as the Acer Nitro
>> V 16S AI: the firmware powers the internal USB camera (0408:4059)
>> through GPIO 11 of AMDI0030, but also lists that pin in _AEI. Requesting
>> it as an input cuts the power, so the camera never enumerates. On this
>> model the same rail also powers the internal microphones, so they do
>> not work either.
>>
>> Booting with gpiolib_acpi.ignore_interrupt=AMDI0030:00@11 fixes both
>> the camera and the microphones. Add a DMI quirk for this family too.
>>
>> Tested-by: Trijan Koju <trijankoju11@gmail.com>
>> Assisted-by: LLM
>> Signed-off-by: Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
>
> Acked-by: Mika Westerberg <westeri@kernel.org>
>

Andy, Mika: do you want me to queue this as well for next week's fixes PR to
Linus?

Bartosz
