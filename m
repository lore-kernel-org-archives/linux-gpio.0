Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF23CF217
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490730; cv=pass; b=kt0DVPkMSyaMCP4woqPEJm6Vfz5Vnu4Z0phd4WJ8SUFwgvc+86Ler0Tw0kHHLlH+AA6zUAxylj2tPfZ/kU95L9e/fUDccBhm6blamyrQDKEHDCL8Q9wgFMMfgCTOTOPQPkKi37L5pMPf4zRcaWzQpoZll5WTwNnEE+bgkJ5e/mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490730; c=relaxed/simple;
	bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYPjz4aJYUOcBUYT0bFjuvY1VTCIHcVf0iGQnZoBJFpnjeT2wwutroYcykcK0k/pHCI4FLv03f2bHlZ4K7eqxrTzycon06SnD9S0fr09BSNvFe6SsnAlnmLm9JZhyn6k5ExLBywo0Qur3LtbDS0fT7x5R/cBCEuhjG6bcOWSBzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WNloJUBg; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNloJUBg"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c4818e4165so1122722137.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 13:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791490728; cv=none;
        d=google.com; s=arc-20260327;
        b=kDlk6g76PzWuIQTU5X7U04I7jKV3T32erLd0QzFs62TBAbU029Qt0Y9IZtGj6OAi3r
         SarJ8OmJQ55SShQyFLYUS3bWdyQQkxys6pBoCv/sG/8lZlWaG30Hc2fbRgtNq08mQeqb
         RtJISezOD6eS55oC8ohWzyXzGBdbXR7ou4MH5PtyMmZZwGUhDzfjagxCbDYayhYJlnYd
         YapOY3KJW4YtxmLj7LAZ9MJ8LPDtuwAUeorS5MLJ/+TGL3eZEH5P2/pgTwTN2VYe4MhV
         AyHV2n/7f/AFkbt3w7GLGFcLaXKA+R6QLIgRX2Qo1JYxrWJK0wUdrJkEWzKrUkbAoL/5
         xZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
        fh=67tbk+tWeuYu255VsdCon63S3tNtoGNKCNtFOCbUi0c=;
        b=ia/cFlIBhgpGsr+839y3lBl9l2RLQlFzKSBwhoQlrPO6hNqJLG2W7cQflD+6rTxCo3
         8jAx9YGgkdKHLfZsOx9iC/aP6m0ZRFiueXTH+b1q34D4c1f8DCj6o9SXKBz/kBYRvYsc
         bxVm7Ep8neuSGSaFrRkAwuttTuTRnCuLHH0mBE6Ig98YwmMcI2LzrXjiC83mQY2GM83F
         bwPRkBE3SEq9YLuHGdU1tuZXYLfmczEi5TjvQaEaD9RIdYOMpaQ38GwpxKrFilEGLjUi
         DblX81Gm+GcZ3cmqbpA+r2aQUswrJIzpsYxz7YCjDbIDWfCAvdk88rT82DMTGYLh/4MY
         hhgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791490728; x=1792095528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
        b=WNloJUBgGXU+Hnt8jj7PU8/8mcYPWvMxpMB81ayUSvfWRLssa/hPCauzEEDRtbt3AZ
         NqVGELPf1E4aJlZu+l6715j9nzfiL1zFgYr4wzMVHRpKQX3oHAuqMv0PxRe4DbbqrCrP
         fYNJNuDCpadfaobuR3zZsmlMQRPtEUwcYNwhw1XAt4a7h9DjZqJ7pSb+JcPtP4MYGe9A
         ccCZcXEOuyBqLFjR4N0NGd0rg0MGsCCq5x4n25FdD0+apjYE171fAjnRtHgmjraLWupM
         GLVIbwdfFklIMWmNPYfPAbcrDA/1FW2P6ZdH//9ZT83JiEwJeb2+fuuf3wZfbQuQ2AC7
         fSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791490728; x=1792095528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
        b=gWbFuu0eXAkkM0U05T4X4H0W3bGzScuqNcAT3yS7Tampfm65n+YeRwC4Eiyv3MKoXK
         HmPigfXwilRDLa7e7ZDE8Ap9vtcFjPdqHQ2TdoLY6qlmY1gzk/dwgo5lodzWgWpvKuIr
         Vmb57wNa/qK5A25/WE+1HJZZxZn8rnkwU24A69bv7DEwwPRbf2yFHPqfxhIgy/x9YD1s
         3ESfGI+s2/Lbb6CKgvA3NFtA1o9xyrNNNkmdebbGSaxLb/U5C34OqRLqyMgWTVFDkaGJ
         raVdWIh3Bduxbm1STzgwPrC5+rCMe8KFYXzDO/uWCIW2dTzTfgvDLson2NL5iqF2LXMo
         pynQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/y9RCgLd1Ma+AlTNZKGlP7T4SP20KgTFsrJJzmv7eUH/pTwJZgxxCI+uzmGBgDdB8/IpIOSz+3wa7@vger.kernel.org
X-Gm-Message-State: AFq9FYIJGzE/IQ5KGK/ctj7w3jZxGO25O47uL8csd1MMRWcifv21InVr
	7LrosjHmpoj+VF8AQHZkY3PJRIGeGwSmeT/RBQMG7OWNnM3HRSnnmX4qny+XkkGhw5Ia0AezOeM
	obheWuH55tILwwXMS1nm3+yTko90nQEEu/Lhze00JE07DsaF5mUVJHLk=
X-Gm-Gg: AYBFou0aAgDNxKvvKaDlVbvXDHEEXn5muESoX37W/R08r0aGdD4vOYiykWkli1UFmWz
	CwBgtTQGZXcOOv1AVHUJHpGUTlyg3k2vEKFM1HNzkhJM4Cx94Z33wZ1gvrQX/pDfFKBqAAnuJSg
	Zag9wrSHH0ffxgLWNqNvSc4doKQW/DCFQMQSlxrdXdkqJKFelnUaJoSHU9NFzAZ2KJca6Gji2np
	4hNW8jhDlsdVS86rK6lxqJV9cRzCL0pPsIsJ9HxCuFcOdZHS7UaZJtBLdGxneeDvNkQzYuroCkN
	dg+NesxER1y3eMiOUt/pTvrhgBhGMpIUoaLhqmFFq5868kJc9s1Ojbd1tufh5v7sZprOn333aYa
	zkaRMdNY0iFwArGifXKVi
X-Received: by 2002:a05:6102:6b09:b0:7ba:b5ea:c4b8 with SMTP id
 ada2fe7eead31-7cb36a8c674mr1668137.1.1791490726658; Thu, 08 Oct 2026 13:18:46
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <asNuMzqz3G-gmIiD@google.com> <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
 <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com>
In-Reply-To: <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 8 Oct 2026 13:18:30 -0700
X-Gm-Features: AclHuK92jAkOpDGnAzk73p0KSvQJ46QvtFBZiCrror6Oc7PBOFNeUEbwDIK5rPw
Message-ID: <CAGG=3QXRPh=3rYyEHT0kTzDZ4omeHOjmN3OZGy=5hupday7jyg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:19=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Mon, Oct 5, 2026 at 12:26=E2=80=AFPM Bill Wendling <morbo@google.com> =
wrote:
>
> > I sent a patch to add `__NO_COUNTED_BY` AND `__NO_COUNTED_BY_PTR`
> > macros to prevent this. They're similar to `__NO_FORTIFY`.
> >
> > https://lore.kernel.org/all/20261005102518.2400984-1-morbo@google.com/
>
> I see you are hashing this out with the right people, thanks for
> going the extra mile and fixing this properly!
>
Always! :-)

I'll ping this thread once we get the problem solved.

-bw
