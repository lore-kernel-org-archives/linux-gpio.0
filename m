Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915323;
	b=aoXyVHSoMD1KhhrZFLBBd7W0XlQ0GpMupiI2ERRidrGSI4GT7Er84PNa2QzZJvNTFE4c
	 7n6HD1LpCFhmDyBWH8dr6Oa7agVpeXXtw4v7T6evOZezXJZnNyNkV9C5FJ/XKSmY9JuUv
	 VraiScEZUvAvkbBO04csoLeSDGl8l3PAZV26nQb/gZ8guXibeIrsGhEY2dDMt/2Yl8eOX
	 WajxdZK6BnnWPO5x3RzQMFDjjG7WsiOTu6E48ZHI8VlroBmq56BXOtDJg7h4rG34xXVXD
	 BhmDw2/+67hzQCKM1DWzFZxQnXvYz4OSTSqrDepENNtoDUm8esFRZxCjcS6oXYZIwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
	b=IRIku/EYLdQlQX/rNpNOBlW4bS9ilesP75hK82RqbBXTwmygawDeVzcw3DmtELONS2DR
	 YXSHeM12KcoVBBPl5ejC9jTCbDT0nzAS8jpcTrY5Cb/GKCnGXhWTPurYzJOiJ9jhOKQaY
	 Za97FdbMJtWcUTn1su7ND9mpkhknFIqfP3Ofi4axolkevGvYQjHArMWb/PPTwR9y539q8
	 O5kPMemoBNCHnAVE7/6EImsZYtkja4ejOYW/edi6Qf3HimCwGUTZCveabTyrrhrxtfeg8
	 qK++z8RQI6AY0uWdaxdXP8v/2vjgiLrBlXwoac22P3/Zmgan6x/FPKJewQ7STqneENw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Sn++kWr7;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69546606A32D
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 21:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69546606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Sn++kWr7
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4322d310e7so128045966b.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 13:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793915317; x=1794520117; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=Sn++kWr7CN2pmU4AKXLXArUWNAmAmH8caGa+6902qsQLk+/PdqjEk66Fd1pjfsTfWO
         EpCJSchUzTV5WPNHbGJx2dCupcPNpJpDGrUwYS1Gg6qc8u34ZZ0SVVU/17bc71wC6u4R
         k6t8/ZJQ12SR3A1Ejge0QouPTlVDAp8cBfsZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915317; x=1794520117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=HggCqVguvomzqL9g2hq+yg2yZE6Mh2lZBvLvO/g1puot3orVh6xUZEF32R5spggvjV
         GOFsS0zHuuRA3GJCwoD5xRIUna9owt+51Su5n5Oogg89ukJwylIxJsHKFHj+/FB6AQU9
         1cN8TE0mLyUcSACos4cwLSIdmUGwHoqC+pCrfvPnM2xXK1sRUVxOC3kCFABGZrdjhU7+
         /SuPv8QuczWvlSMTWBwPa2TpKK35Ex80J7ea58BkhXNHM2WAxf3ZvJBTj3HuH3g5KOkS
         RZwzgAU5Z1c7myEEvagrMUoem8MPZPEoIc+imqprW/rOl6dzaJm46VOsTN7XPTdgslpO
         dv3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMQPGQ/xFzD+ft+vcOdKN+8xq4e2HeadZgKe6irTekkK/m0tX8GSSli+h6wdChyXcFEM/2wiLD7NxK@vger.kernel.org
X-Gm-Message-State: APuU4Z/fZzZ/GzTioNJ9VdGRFi/EgbnECKoIiEGPsf+ka+6+unaieecg
	8jtJAOBVSiyusd3c1pe7KyrVwi/4ZBZcIOW40TgWdlTxFpyngaAlT3KE5TEIopGX9tmJjK1TEOR
	E+AO29ocJMg==
X-Gm-Gg: AYBFou2D2Cb0OzX6PtJllG39lPR0aT5ImUNouWllPQYudP//U17mTRzv+O6oF9IL1Qi
	+E8ARpfMJ4UTfUtAMHucFhi6nqtu+s8YlGE+ZSvtduQEXNaXpaNwGMAMkrZqaWiSAcaLlwOUxqB
	hwvbsf9Tx1fJX9QerxevH8UX2S7CSPFNyeXJBEw5F9K2prvQ32yEFyGgKeKOQ6gz1ObA1nxD8ur
	hx0sFezLLZrVSbLvLlsoKyRBDfaLitOm4R2zAptnvbUFsgzVLeOCJbWnKMs3iJoJQiT5Bj0g6Dm
	2XYWi9nH2G1cETBhYv51qti5PG2lvEpsQa0ElIagNSeUSnb/2x1N+Bwi5/wpBk2aO7ECIQM/uVx
	XS8QlUu+jeL/AOVY/1UbsaqFPirO09Td9udye79EsPdi6a3wtvKm2FH03BhnuP13L/UYMtrOAeo
	ckX0zpr6qXxkBN5OCQF06vNC93u0VXqaaqVGd2YFaoORGBMPS2qX27mJogNb7MaGp+KjcUjpLS4
	bRwVpSGbcNNhJA6KmPGC/g13YA9r/AXl3dfr/o4qi8dKf6qi8FnY9/Bu4vUJ2StcruIcEdoVCXF
	00WwoFbeeW08vmSmEuPDykafMhQn9MoykzRk+6eUv1A5rOZo1ZvRJEq0iSdPNh341YkDpd7DuYm
	o0y0=
X-Received: by 2002:a17:907:ea5:b0:c4d:2867:281c with SMTP id a640c23a62f3a-c4d34691c9dmr67979766b.1.1793915316745;
        Thu, 05 Nov 2026 13:48:36 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566f7fdsm20595266b.31.2026.11.05.13.48.35
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:48:35 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c34bff61551so113702166b.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 13:48:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwSyzQADm3GUzUM0GwU4bJt2yiMJdph3z+VVa4MczTdrlkm1s1+DrTsBb3eYEa1J8kksfC8ZNrIet/i@vger.kernel.org
X-Received: by 2002:a17:907:2da2:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c4d34d39a58mr58567866b.44.1793915314942; Thu, 05 Nov 2026
 13:48:34 -0800 (PST)
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
 <20261105111423.360f4ba8@gandalf.local.home> <auyuINXEJKc1KoG7@devuan>
 <20261105115019.2fe7c91b@gandalf.local.home> <auy0O467UqOzqYub@devuan>
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local> <auzxXyAU6zyHtMtn@devuan>
In-Reply-To: <auzxXyAU6zyHtMtn@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 13:48:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
X-Gm-Features: AclHuK9v-o21t8pmiI4INk2NQJoSrOcmPCpk8IDpuzUs81f6KLpwaM7gxXogW80
Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 13:24, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I think it might indeed be that find(1) is slow at filtering, because
> using git-ls-files(1) is faster without piping to grep(1):

No. Your find | grep" speedup is because you use two cores for this.
So it's slower, but does it in parallel, which is faster on a machine
with idle cores.

The reason git ls-files is faster is different: it's because git
ls-files is just that fast.

And it's so fast that now the pipe overhead is much much more
expensive than git itself, and so doing "git ls-files | grep" is
slower and only adds overhead even if you have idle cores.

And the reason git ls-files is so fast is because it doesn't do any
directory searches. It just looks at the git index file.

So git ls-files really does something very different from 'find'. It
just looks at the files that git already knows about, and it basically
only opens '.git/index' and parses it.

You can *make* git ls-files do a directory read: if you ask for "other
files" (with the -o option) then git ls-files will basically do that
whole directory traversal that 'find' does.

Anyway, if you search sources and don't want to care about object
files or other generated files etc, I'd heavily suggest using "git
ls-files" and "git grep" exactly because it's much faster.

(Ok, "git grep" isn't always faster, the whole regex algorithm issue
can go both ways, but 'git grep' does do the same "just look at files
that are actually known to git" thing, and obviously it can look at
different revisions etc too, so it's really *good* at greapping the
actual committed history, although if you go back in history you'll
obviously be paying a much higher price because now the cost is often
not the regex, but the unpacking of the objects etc)

            Linus
