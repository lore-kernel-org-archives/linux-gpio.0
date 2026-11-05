Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920915;
	b=uScol/AQW/c/0CAQCJ0k7ds8gRgCFliieqMvRZXK7O/S7FPw3mVZ97gabYspr5rK+twt
	 7Eq/Wg1QjcTa5H+rHVjYfzcOvSTQW2UD8VQemrqA1qRsds2XdJPYJlqA0AwztYvGZRmBL
	 XoeqgRUkJbrrT+VeLKbYcSS546dB2ZO66V2YeOkVmFTxic2ddfLy4g/CK0WYrvF/BjutH
	 pJ2vbWzSxKlpA2NopFbLJ2Zw9WJ9COqLWqyLJwmdIewJR8m12bh6N6Hpd+TRGJxyRhhhF
	 FueFJ3HqQUQy+puKgzbLbaHx8/bH9HOnKPQQbJ/L7EbM1xZvLLMP19WPwCiog9boveA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
	b=fj9uQxuvABiUUcJnExMrIl6cI57qzydDphJTyHW8bFs7ys+bhg1ESR2ixhWkbUZMlIkJ
	 lovG0ZpyLhInmbekSMc/h+iQ1RlCw4vOYXKKjONUG7Sb2fAZ/s7nezzXlysHV+0Syy2dH
	 wceGu9MjvZD4HJNKGJ04cN34rXyAgdeynFklN25nAIT1tI7aK2gjN9k1GFWUzHffCr5SR
	 O4J+pQZ8Ukl7f9b2P+VF9t/9bLS7ZF+2nDF7G3YwdJH1OLXFXAgPu+sGusjDPkWA2S6/e
	 1f+90CQvmFFYAo4f/l/Dal2Ndn5Hf4thYXcheLyR5d8S2JOiwYF7BvPuvfrZ4bj8Irw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gPo9SPxF;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7564606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 23:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7564606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gPo9SPxF
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d28f75d62so6309966b.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 15:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793920913; x=1794525713; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=gPo9SPxFi2rVLsKhGrCqqE5hE92NbFoq1Zi2JOci1ChfKUbD/F6dG9k1a30KNoO4ZF
         wClRGp+wp2ZjBS96hWxBSQamrLKtcD7VPC+k7NnmR7j7oQdpAKf8jlOaJBX3V5M92Mfj
         b85PiFEwv9zEk1nfcT8S76Bsz/+2lc4z+sJno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920913; x=1794525713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=Z3+/T4SBLSfNiVYC6NZ5opBmU7kEqRspvWxma6rTveqHlN2SCNSkPb6ryWNh3LOYfL
         e1De6/rhqlyLhunLPEEUTOJQnUilZvUf4am4Q1sM7IqIQ5/o9byFqpRYb2G/2hco8i4+
         ITljj1zvomJcBxe326ntwkYXxfX/j06qdVpJFX+iScMVtOhJXrxF3eaYvA1gSeIXpsNm
         a6ZkcJWzuU7jncezDV8Hi3kJwtyj9twiydBtcHsOSkznZh7juW0RslCX6iVoYvBTLqV2
         3jERJEMRuLJ+uChh1en8yDhPdMpKxTBsvxYgGflTYZc8Dr+uHEHPQf7wes2f7YBIaY+9
         eiBQ==
X-Forwarded-Encrypted: i=1; AKwUvByxiB08LHFnt1yc2lDaApn4B9k2xCAKtOFVcKCqo691xljxBwy52LbOfrlpJCCqKFVds2V6Su7A2Qas@vger.kernel.org
X-Gm-Message-State: APuU4Z/EwrY0kd9KQA31xsSoGoS3xrmBrpRoASWflsFLCorGA0/pdDoT
	ZmDrDFi2o32oi8HEKTyOjfEJ0EqIZQSqtRfK92sg91qJCKdcQYKFg46/sq9CzZc0ABLCCtUQOeW
	QHOBkPjfmJQ==
X-Gm-Gg: AYBFou0AByGgBv6uBVHLObKZlkPeHXf3r9WoHWPBfHPl7Zt1MvNBJAJzVXKHZtFcJiH
	9ITtL7sk5hBS9FnHyqo+v2+35F/s+qjkZoqcyn2ZZxaRM7X94PoTCaAzJodpVfY2QNCp4gHJ+HN
	FXoycsC5AtRLCuVaaPpgRuKCrW3U4vfH3hSCos8iJSh0agKQwXb2EKEqT9cW//MLL7fAJhxukPY
	PqW/E8RERPjlH4rGjSd7GnFfLg1rlTfp4COcm9dOfngu7EloVW+ctBcKu5ewr9oe3OSesdsuIVV
	6H8jUrvd8kOuVWaQDPr+gxvEMJPaduf/Af+6pAih0zHsz34IggcTQDq5ZqAhmDsrxvK7RenXIhI
	by8+e63MXwVPIbsGA9eCX91ZBVy7wbo/LiNNEuo627a8n8Tar05fn3taqX16Umw2WUv3QTLlz//
	hXhW1f/UesqMtiSX6rY7dza/0fnT2cEGw5uh1STntg3i4ufCRiOOPtk7pRiG3Yfl32LwUzT7l1t
	P9SDVVkFLV6QZ4JBWIvA0LTgCh+EM5bkIROiGJspQ1/9a3G2etIaoW4WUCXyQ3URgmXSxmgJmZB
	DM5Q7VKrrv+08rFdZD917XhdY7Cl4qxeLXHiHJxhP79jsiD3hstH9hviZshtUvFbpkFTVwytwal
	w86aZl8cuvKc8KZ5C/QwXExo=
X-Received: by 2002:a17:907:948f:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c4d34cc5a89mr81569866b.45.1793920913033;
        Thu, 05 Nov 2026 15:21:53 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac7d0sm27567866b.4.2026.11.05.15.21.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:21:52 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so6307966b.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 15:21:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwzREPjRt00z5YTPfeBJ8aI/o0ja3VrHBmhDOmHsKIF5owX/iYDIY09NrP16feGRdfO7hPBd1JGwbTp@vger.kernel.org
X-Received: by 2002:a17:907:9c05:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c4d34c42700mr81823766b.32.1793920911855; Thu, 05 Nov 2026
 15:21:51 -0800 (PST)
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
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local>
 <auzxXyAU6zyHtMtn@devuan> <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
 <auz79Izf6Q5qOQPi@devuan>
In-Reply-To: <auz79Izf6Q5qOQPi@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 15:21:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
X-Gm-Features: AclHuK-tRyoIoIlVqV1ObINoCwGUeXX8nUrj1waZW-FHLSpz23irfQuKt09nDLk
Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
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

On Thu, 5 Nov 2026 at 14:25, Alejandro Colomar <alx@kernel.org> wrote:
>
> I'm not a fan of git-grep(1), because it's easier to remember grep(1),
> as I already need to remember it for other stuff.

Why?

"git grep" is *literally* the exact same thing as "git ls-files |
xargs grep" that you apparently find so natural. It takes all the same
arguments as "grep" does.

Except "git grep" is way more capable if you ever go "Oh, but I'd like
to go back to an older version".

That makes no sense.

> I'm finding some issues with git-ls-files(1), though: it's listing
> symlinks, which grep(1) complains about.  I wish I could discard those
> with something like '-type f'.

Christ.

"Doctor, doctor, it hurts when I hit myself in the face with a spiky object".

Stop doing that. You're just being silly for no reason.

>         $ time git ls-files | xargs grep ARRAY_SIZE | wc -l

Just do the sane thing. Look:

   git grep ARRAY_SIZE | wc -l

Trust me. Just learn to write "git grep". After five minutes of doing
that, you'll realize that you should always have done it, and you were
silly thinking anything else.

And it's faster too:

  $ time git ls-files | xargs grep ARRAY_SIZE 2&>1 > /dev/null

  real 0m0.636s
  user 0m0.367s
  sys 0m0.307s

  $ time git grep ARRAY_SIZE > /dev/null

  real 0m0.519s
  user 0m1.837s
  sys 0m1.719s

(I used that "2&>1" to obviously remove the errors from the stupid
mis-used of xargs).

And it's *safer* too, because if you have filenames with spaces, "git
grep" does the right thing. Your xargs thing now needs to start using
"-z" to git ls-files and "-0" to grep to actually be safe.

So just embrace "git grep". I can pretty much guarantee that if you
use it a while you'll never go back.

            Linus
