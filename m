Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B9325495
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590830; cv=none; b=BVxldhSKlfrUr6bonOD6QqgD93/M8h3bRUyUAna7baRA2QAsCo2TrFo8wNUmsgn2T6B7NJGPhlYOrgfj+Yue0WGiZDDqkBDW2SfhiATZ4eCGhy50AW1jfTs4IYHOxejwhCdDKXrZGm/8G3ye920iPjpjZUzvNNIy/yBzgOz0rY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590830; c=relaxed/simple;
	bh=COft662QrCtxqDPTFCDN4FeyTD40QmUm0MeCg06LJNE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRIXBxcpRCu9PfMtFeNgPN1u+vUCmQ6sl7lXUJo+tp/qwehVmDtjNPZNdfY8AiQ9NxDyUTFp9dSvFLxAlSyRXHg9ii0MU+YMiIkO9Pkf9YRNMwBAGcgUagNmCPofwd+clhi9s2UMmUwxVD39EXKHKK/IWLHCEmwLKuqyXrzTH3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqRrn6Bd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqRrn6Bd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06233C16AAE
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590830;
	bh=COft662QrCtxqDPTFCDN4FeyTD40QmUm0MeCg06LJNE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=XqRrn6BdqpR92kl641/4QACZf8HUP4sBYnbeXbqAE0JKcvxjEUsNDAYdjhfCykkHD
	 0uL3RzzV+EFz7ENpVXFFF9DjpnlhUErulISZNna4QmqzAfjGZJkQ4Nm1OfG9mYFhzh
	 VSBQa2SFCBO124voS88QYq2KTyCM7TlZFRizuqOLgK5YjFp2DySe3b3y1S/cPWut5q
	 ZZ+mNaDtIrJXdYlyVd4Q9gmgo9Zv3qbkRDyEm2eBgIFlMctfE57ZMC2D3auXqkWjr3
	 Hf6KADNayV71kCeEuCmLs0kD4xu8CbQYmnUBQKBqav72VpyHIJNIlzP1K681hZJXeB
	 uDRuecIn+Uy7Q==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b8466b4a8so5731554e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 01:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtCKmVU7xw1X6uhxD+22jH4JjZtq7Av7JWWspR5WFZKcOO2NWbNhKTd0pere+fs3+3kPVVjwDPfOK0@vger.kernel.org
X-Gm-Message-State: AOJu0YxR/bXv/PiIAYRA+2xkaOhEe0L4m66KhnNx6xOxPNj//U7SDDjx
	xpUaz3dbMZLUPQ88bwATBZUqVFq+TlZVUaxUDoZi2oy+bPbIHRASedjJqXCi4kaX8OuKf+IMRNB
	Pz6g2bBSRSxa1dZ8SJ/g9vWa8eGAhHMTk0rHOcx5e6A==
X-Received: by 2002:a05:6512:3f1c:b0:59d:fe49:7f6d with SMTP id
 2adb3069b0e04-59e04012c50mr1936977e87.5.1769590828677; Wed, 28 Jan 2026
 01:00:28 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:00:27 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:00:27 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127110824.4020130-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127110824.4020130-1-andriy.shevchenko@linux.intel.com>
Date: Wed, 28 Jan 2026 01:00:27 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdRjUx=z7hKmYZPrzMG5USqL0k8LAaH_xNDU-Pwc_8-Zw@mail.gmail.com>
X-Gm-Features: AZwV_QgPEgJAisuCJXy0Pu1aaC5mOo1khpr_Rbr1SUYxOJ-moXwUFtaqGIONZf0
Message-ID: <CAMRc=MdRjUx=z7hKmYZPrzMG5USqL0k8LAaH_xNDU-Pwc_8-Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: acpi: Fix potential out-of-boundary left shift
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 12:06:30 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> GPIO Address Space handler gets a pointer to the in or out value.
> This value is supposed to be at least 64-bit, but it's not limited
> to be exactly 64-bit. When ACPI tables are being parsed, for
> the bigger Connection():s ACPICA creates a Buffer instead of regular
> Integer object. The Buffer exists as long as Namespace holds
> the certain Connection(). Hence we can access the necessary bits
> without worrying. On the other hand, the left shift, used in
> the code, is limited by 31 (on 32-bit platforms) and otherwise
> considered to be Undefined Behaviour. Also the code uses only
> the first 64-bit word for the value, and anything bigger than 63
> will be also subject to UB. Fix all this by modifying the code
> to correctly set or clear the respective bit in the bitmap constructed
> of 64-bit words.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: added a comment, named variables differently (Mika), rebased on top of accepted patch

Should I take it for v6.19? Fixes:? Cc: stable?

Bart
