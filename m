Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF3339381
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258486; cv=pass; b=q3llPt7AtoQkJCDEzPNQJ5A6lfHdwJue1H20fQPwYMxi8UoSFa5xEXvFYDoWUZm4IkAVe/c13Tm4AEpzcV407GlSmMYBHCJJQtFZD3kbECKGbO1I/pzIKOcrDGjGzeu4bOfGV/R5fo1UcHXxIkJaj4XzGxGAkQsRvhL67fGKj4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258486; c=relaxed/simple;
	bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yn6JQpKhujZbwtMiF0nBAHN1OyqenGrBS/O6iAmsISayuP56OukIZM3vYuUmSynQx02Js9o3G+Lbp2BHr/cFA6AWyosbyjqG90RwQN7wG/sVB0kPySf8Kuw3UHPBJ2quLVwHpF8NwFmtIdNEm45de4Q0dkku7hxv+8hLjaGiLHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD4naID+; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD4naID+"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39f20d19895so31880061fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 03:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258482; cv=none;
        d=google.com; s=arc-20260327;
        b=Cr1b8KBTR1fuj9LMT+8t7XZ97zZWyhcipQFEBrgu3d9/wamTNW5GXAKdggvKhYxkpQ
         Ao922cKKThr0CGuFR6qoaCkRTFrMbRGhcz0nq2LhOU3T8JgsA5STVjHRBA8q1d7zpzUw
         FmcMVVVVBlWkQ5uLzcaRJeGlB1N+PNOdJTwt6IVwuT/Q8wZuWu1P/82wiQ4NEcslqLiB
         xCXMiLY1BHH5TuM5oRNMp1l1t8uA+jNuTdyimVzHsFeAbroNq0xZk7TpQ8QVDnWb5WBP
         yYFWiK854ORJpbsWroHilsrAuTN11xsXJj0mHhQepz0Tb81/HNDC2Z/Mb6a469ENgFpq
         s2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
        fh=vD+lqQuO7EbNpJqkomT8LMnTYM8UgFrE8bq6tK+f95I=;
        b=p/We0Ib45ru4ED7iVfyxrB2J9KG+Mp9yya8nXzRe+pFOX+cgZaMh62gl98+AV9aR5D
         qdP5I6zPV2sgInId6APtkUyYyFssrhRrGebUuJAH3TsqvHmpVgncbdLK7dCJChNc1ohC
         2RQZejt34PJ4bJo6x1dngp2N+FAMWyXiS3E5POxXctOAUCl2qh5buwlFUmsTOIbESi4i
         mj1hGpM4RW+lkCwNFfOubc9w7/oR28vknP6cUjTbK8xbr526yougaR80xV825gqitjDU
         +2sZv0QEybds2tqPVUVBKsHfdsUhrjSHeQYlG+cLK0ilp4EJytaYjBdltF93nakww+hj
         atXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788258482; x=1788863282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
        b=GD4naID+2f9Pu4Z8SJDMTTggRM0sjj79qe7A4adyIqCQuJ/f7Ww8erv9ztOGA3RnFG
         6eq01YttuFogZWLdxfF+2rOqbTchpuxywNCY+jo2tJ1DGuTE8UjACeeOJSodo0sqe9SA
         vwq31V+3H4It1x9JSGDutVUMZ4q9aRuLVZ83ABvZ0/TW6LNVDh4XcVKclALTbMn+sQFO
         LMIB0y6LFrGinvc85MhS7KSi0CZCO2uxhq+uxnjL/9xXKCYtrM8tjbBtqtHYM10QrJiN
         7chSK87bYl1TQZsDOI77b5wh0QAyJFtzXxdJqxJvWny34tBch1dmV94x5W5jczOCGDjM
         MDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258482; x=1788863282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
        b=pLd2Zl3ZMfx2hP/KmvFR1qdATCAx63kHsxL5DklRgTMq1AqGK7T7fS/zvaaSDS6U2r
         r9D5eiv8RdJYeILMEGvlEri4RX1a/aSDSDWTu6/mVpsBGFg8BbOkUnaIQrXrt2kqXq9t
         jJ4wVcDuqov2tV0frcEvkF00tbECw9ADxMV0AlauMUDUc72q+IgCMu8AXp27EQdoU4+0
         e/2r888u7eH+uYgiDE1MDe/a29S/mf8+qnTuHfQEDlhrksvL3U9Rytm84XIVw9fQf78h
         oI8DBR+ros18wR5OHqwWpcUuSLeoIxbyeW/9/Ele5CVAHJHkwPzJtM9jw8+UO8uIGGXR
         s2iA==
X-Forwarded-Encrypted: i=1; AKwUvByQVPHmgEolWa7mzBCP1S5HgF0YdCN2GF4oF3Xx6DCMoDsrz72Z/Jix+WjYDmJZQaZCM6FG7cFNo6Hg@vger.kernel.org
X-Gm-Message-State: AFuF++lvLvwDyqVGu7Vdw/RsAbSBIg75it7LlJB9foopFGbvfb6z0xny
	GXBS4TksNauUtsyd6vMRM4o6xQ3tn0bxzMfly83ZlSq7hQnbp6Mk9koRRzEZ50dngL/nOTgVUI4
	gxVRJYJ3xQz4TFzqp0rqybPeMU0+gthc=
X-Gm-Gg: AYBFou0W7xVsLb2HvdX3lwlgVnrQZjnrHlMSV+8Wmnn3qCDIkMoCxWF3myO5Pvq3I9R
	v6H4pjbZYuorLQ1gmyD/IccGZVqZTwYc37D5iBgP/DraqYrQQOZjA9SdAgh0udvZAJ/xMy9Rn4K
	Ay5w7JzDiMT2eJqGqtaSLqRc0L3LqzY2Ra30eQ24PfpOAE5rooe9nJtKYiJyWVt4gkG+1h1Ko6Y
	vTOZv31q5vNpJrrQVZJ587BWocTtXYTOqMl/7h4aV0fxDEdI5AGo0Y4aMGirWm3kfg0RQSbE9XI
	h7IKO8fPB4JexBhQ6BG6xxSyMy9JiIJ9VarveL9/fWVkVryMK1EiaY1mpL8rCU+caoePqbQ2cek
	wHUnC4nYGsc198D91DUZUGaRGxJaE3xNDPf750fbPdGxytJ+hjmWfTPoCgarmCcrz8/2oboLPt3
	rO13gmgE4icuE3qw8codcbYeJgRRjevQ==
X-Received: by 2002:a2e:bc1a:0:b0:3a1:7f22:93ec with SMTP id
 38308e7fff4ca-3a301ac17femr70548301fa.7.1788258480982; Tue, 01 Sep 2026
 03:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
 <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com> <20260901102428.GH106095@black.igk.intel.com>
In-Reply-To: <20260901102428.GH106095@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Sep 2026 13:27:24 +0300
X-Gm-Features: AcwNN1WgC1bCIJ_reqGXE4PLxo0exnyYPD5oOf4cmGwFgaL2WmrJZYZHO1OB9ZM
Message-ID: <CAHp75Vd0weJnX2yb4XY8br6xD4gUA0dogzyg7-KNuynOtXnziw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Try to retrieve driver data for
 pure platform drivers
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?B?UmFkZWsgVsOhbGtv?= <rvalko@lipicko.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:24=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Aug 31, 2026 at 04:25:47PM +0200, Andy Shevchenko wrote:
> > The Denverton pinctrl device can be instantiated by the Intel LPC
> > driver as an MFD platform device named "denverton-pinctrl".

...

> > +static const struct intel_pinctrl_soc_data *
> > +intel_pinctrl_get_soc_data_by_hid(struct platform_device *pdev)
>
> pdev can be const, no?

Yes, but it will require also to change the existing prototype for
_uid case. After I get a confirmation the fix works I will issue a v2
with an additional patch included.

--=20
With Best Regards,
Andy Shevchenko
