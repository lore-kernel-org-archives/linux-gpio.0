Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC4739BFF2
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345603; cv=pass; b=MnRt7A6uMgBamk1JLd4sOXVOYgIfuo7Jm6IeUs3r/DykQoBnfx71EL56OM28rSI+yRg5gXjyfc1SPhEpPkb0+MfaTOTC8Zm+qNn+w3hNoFxm6pQJfDmBz58s3IwsI7tqwJ8AeClYcE8SKYSFXTpH3Bzy57yhAUiItuziMexyAwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345603; c=relaxed/simple;
	bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpIi9mBiIhHXgDm3+5GlpAHP0lz8tSM0sgtOT4E4T/BNHuCCQIQ0s9VcG9RtK1OLI6W3+hljB3xEkJiZT+7R+It0GyvZEvnvk3Hyi6x5OJyFDcvGrhEN5ZDHKEPZX5jemSXfr9aD+w+gqfDiOqUYiS6FDE1orEn2JtQNYgGL41k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7m6PJXO; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7m6PJXO"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so10196731fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 00:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345600; cv=none;
        d=google.com; s=arc-20260327;
        b=BLtHe/nqLa6GMBa1YpVNhjOA9KtJW4QQzS4pu+jkjoISrQT4lPYb8BfJckK5cJaLL/
         UqA/mukBqRlUtRBDlQfdje3TScypEtBAdC/LHtTW0rs/G0uardHIgRm278kjxwt3Q4BG
         MT7hHB1H3R4RdJa6WI7GhwKYu7DylXSgbKrt7g/VM3QjMe/eMOWkErWGVkmkDA0TLjQs
         S+YjuXMr8AbvKhPjr2No9EMNAIaK87hRITDQwFE0tmgSJuk2qw2q2SZijPzfXgO+8sou
         bhA3QohNOqLmibXWtMHZ8yTOSxe3QYkHLfGL5HHWzRa/AuYhPkySXNzQNS5MTWPRiaUj
         NO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=;
        fh=iihsQ2hUDrXu9ABZqJtdk6S8FkLXHZhSCXmHvv0gM5c=;
        b=nS1CLkgD40LfKSEpraLze/bssPGZsOjIzyCDmv0tyhCvpcSQJT2EH9W+IXVEPTw0JJ
         C23ddn1X+Bxtow+SCd7jMW2W/VppzL0VjVLMrYZJEt5N5B8zQUmpdnPntl5HYhlTZITY
         ZZlgfWr9/5KeoD2U2DP7v2+nXwYSWaD41AtVLrfQeAZIZ5bvitrinydHrPtaQFIOdYlf
         Bmwjs3EBCCK7QRd/KThGv5IpsjxOyKYIfqugpicF5Hf6E6HkJjoGrLct26nXdk39f6Vi
         kaFvhkCDswgTpBoEG9eQb4361Y0hvtXJGp1qzfudd5aNZrtFLHqK2YC7aAmyrLYe+oW1
         o3Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345600; x=1786950400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=;
        b=F7m6PJXOuOrYSKZOn6fwZNFDEMbLw+BSKTIPhbdqnPgDMZxDykZ2a0tHHs0x1lunzS
         ISPGN4Fxi2pJ7/KqR27de/1rrcx/GD/Hl4KJLp2C43vMXbC0DEuMGqdgTqfDRUsEZuZG
         bPpc0ZC24c0m0q8qNl2vRkDzlpXzv6fVVXAed9XVoJYs9klYFGWSqrZsAbmMNE6Xq1QG
         J1osyskS98IbzdBMrHc8/+qr6a0XWFDxHwgV/jrqsyeBQlsu0mnsxt6IWMJe1e7n2KyC
         nnFBcDeVJ45fK6Dq4h/NRcFMU58wpmyYKWTsGz31XIbNHTIfxrZPS4VI3xwzfeZogNXQ
         Qbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345600; x=1786950400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=;
        b=kkVdGJoIpvPy7vQ4S4zXeOgbLVi7SFpgMNHnfExVODhNa7o+CeWx4IXbrZpg3HpyUK
         fZAWOT2IRC9sDp8KdXnvyB3kMobvu2irb63eMFJlBQf2sOR/dcKvIyElRLJgYOLz2N6/
         cRBwjoTc5kOOVZvKw5Q8Mxs76QRWD/phOneQwQRl2Km5y+ZEvCQ6o7or0/WIWn03ocaC
         VNJD6Gq1vtSXIJW/IpD/YO0ks77yQKMRXxvrp3BMotO4Lrlv3VrjW4O4oLNQdGm55Apf
         1xu5yu79O1qKAMHshjGb9JAncrBq2ODg++RxR46UNOv6sUCNR8EHW/IWYYiQUKx6Wzr1
         D+OQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW46gAv8tk9zt+0PglJh9G1F/mwzeBQOCT2eyuAljF0oR8iT9R1Kq0+jLuq39oBYjMUZeci+LzD0Lt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh44Sg++GbrU65+KukkR/IqjizPymNcAd3EoEG8D1q8Zmdp693
	gdRBNQPLUzMYfniStNB8mqBIiHUTqNKb+Gr/oqUztLv7crrTw6TtaE++DvackNiMF0Hna5zCyRg
	UxvABhzDAvhtJnllU9gSEf+4LOooZiGg=
X-Gm-Gg: AR+sD11doo8eIK2yenSzNPXakPi7rsCUkbkiQtLA/5n+xRxnhivn3rVLKjXFEEocbXA
	8LC1vMzc1pGsYNKcz0oVkFIZZWctOlPkepN2PnGu1xX+8sSIsEf8TdDP+NaSzD1b9DBy0t5vUM0
	OpBJ6GO3t1g0UkbWVqM1Ylq/8M/3Jc4N0K6UA18N4FeXurXezEhfTmj7N23xbQDkFJH82BLXVwA
	PPW2YFNnoRIHQmh5MXA/DA4Ax1NNgXGKSqDfu5tQ97sgfDxyVk+LHpiByAVQsxAnu1L1BTa6akC
	vSOhCAiG8nR1tEculjW6j+l+DIakFMAdCYHhYkYcgTufQvE16FKU55W7MemNR7aaOKNsb6+HFx+
	WX3nQGqZhn2P4VtQAal8BWVS1UfNwE5xr/0smmkexGbcHMnKaYjEvVOY6udJPWTyQqXlYMaWiMB
	v3O/F+K3t7mTWYMi4NpTW15L5zjv8nFUUMM2pXhYC5Og==
X-Received: by 2002:a05:651c:515:b0:39c:628c:15ec with SMTP id
 38308e7fff4ca-39fbb20370cmr42017491fa.23.1786345599591; Mon, 10 Aug 2026
 00:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 10:06:02 +0300
X-Gm-Features: AUfX_mwwgXVwFIJAHgeFASTJpkj6tyq5vvwg3fFo1Zsxr234OStIioODHNuDBEA
Message-ID: <CAHp75Vfj9XdGY=E1-nDXhwu182b1ikoruzj2dGSp_H6kOo0SDA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: ocelot: Propagate errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

Same comments. It may or may not be okay to have such a change. The
less disruptive one is to check only for a deferred probe.

--=20
With Best Regards,
Andy Shevchenko
