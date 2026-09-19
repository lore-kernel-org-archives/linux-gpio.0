Received: from mail-qv2-f3.google.com (mail-qv2-f3.google.com [74.125.230.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83D3033F7
	for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 22:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789858621; cv=pass; b=I1wc9XdxZ/9+T3nJf8AFx5DhQkies/pv31glrrcjuvNKxWnvg638Y2MOnEtDGlCTr4WL39ZgBLqllnfAZWgObY4qu0pLPkitZJ32/hs/vAjJ+Zp6Kypu6LWpS+l52ckEInQrGWLzef7rAeBKsr0hxQftb0q7SmxakYIx7F1TrSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789858621; c=relaxed/simple;
	bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfCrhBGhQGjrwZ6GMOQ3IXS0HgD/kOf93OGSuSLnVeUuD35Zm/oYYvM3D0nuz26AxNuTFH4/25O86pQzc37Q/hjpFzm0Z5b+IleQGkrBu/qngrmNWjeX+MBIWIYOByTMcbshEN1VScY2sEWKCWeay4KqVLdjWO4a4MHP6eQam/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6tpTM9h; arc=pass smtp.client-ip=74.125.230.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6tpTM9h"
Received: by mail-qv2-f3.google.com with SMTP id 6a1803df08f44-91262b52687so7233676d6.0
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 15:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789858619; cv=none;
        d=google.com; s=arc-20260327;
        b=aTNTmg5Et/tmft98H/aBl1aa7XODuZjbeE/wW4pbCnlj3LPUPwT+C31I9GARD1/n3i
         O9cJ5n939TjFU5mnx43ySZG+0W/gWtD8DaoTlC1Cr9X+W9CaJpEZSTpxt10fhWoUceRy
         tL0GhOGy5/h5lrmRTZD3Gro8acOnmk2/Q1z+Ij52uMrOJIALNNfULSngSM8YoOrgDLH7
         mUW3CeZKZHsCP0Ygbl6BW9MO36dZim0XbtJeQcXOS5Ttj0me55+iq2/5poHdTzNTpuar
         5vX6QfgL26rpG7hfX6V6D5va7NdN3SGTyQ+enTFBzsqJbUsMdXdRk516qy3/cx7BnKMU
         sXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
        fh=cleAgniphRJESklbnr8JxZHa9c94AKMQ9cPlTuVc00k=;
        b=aJHcP9cuQbeF/MHOZHE38jrq0ltwUavi4S21nba4WfjzRE07LOJ/WEYRQZLgKlfaon
         NGNQ9ZBG2kaFArQn89V8HRTbRHZAHVt0twOvHIzuhLmE6quM61iDKhyq5Vd6gcwB4/S0
         p/HwzX6UxbIEvB53/iejLXI4WW5Wm7z9o+5RDZDsrejgqmM84+8WZXkzI1nZkY5LMIKM
         MSIhGYOZE4/rjvplQVhhyAinwyuiCRMBk73cOAXEQF/rwxbEOMT5bPnn+hEyD3iXWhsk
         BhRdgjNT4P0lFRVh5lFUc2J2TfaVaCzdnRzjFImep8Lb8fyrpNhiDnYiZsEZ+XdYNaUC
         ii8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789858619; x=1790463419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
        b=j6tpTM9hr10a2RPAGTMtAcM4/SNR8y3DjbHafkmdQqQlu1A3EnOnV65QhwwfL7iGxZ
         74KN6GhrbnBXSVJ8bR+UKeJW9+unZ7ma/ug81g968yyGtFU2DcxX3LaoEcwjnVMAGbwu
         b5TFTsc80Q9vbHeAqGwu2Urar+nRNuOobpJyipO2nqMEBR5hCqK4Sk5fQrIiy1dKMihv
         3nMcJzDs23HdKXUgqFr43bkJEFGyFYuZZI7VJAJb0HGmSazQL5ZVfzjhic3/hJQMbsvZ
         02J7qhTqD1mA7ZQfQ0qPEM9+iWJ/Ev1Rc789BaH+ey/ea4e1zv63RDbRgmtOjVCr1fkV
         qWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789858619; x=1790463419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
        b=dMZPrTLKb+cOkiS2OWyOt3GwyAQsMgjnta5kwXf3TmtedLVkhrlb9T+8lKJCuBBzze
         F13MR4tXUBKkdbEfe09Jhz1otnwOruiDM8937XCynEZDWdNGEgB3fDOoW1Wjwan8wPH8
         asvWtY34AgDkOCVp92f7V5hoL7hkZmGHIqu2EOSeZLgMtMkhax8mAvrf/OlKafbBNoWw
         /ULA7rbuicA+c7lsHqGq7axvi8mniS76r0lJAoxkD/9PX5THMSoDxt++i4amxTMAiroK
         iJXuMigA/aH5o78Nn4LwtCuZ9WCao8sTCHTkGwH3btwckmxzm1kXI9Mg7CLsL0mu7OC5
         VMzA==
X-Forwarded-Encrypted: i=1; AKwUvByVMM3xB27EQBncDXRxJHziW7xo8xStD+PAcrYvFjDopYFHWku6d5/wauX72a/3tmg22Xd7PNGlcmHv@vger.kernel.org
X-Gm-Message-State: AFuF++n4KHdJJXyDXSMW7egxAe9U/lMN/BMpYHDTLOlLtZTQkjGQ+JAa
	kw/b42QztLpguARJYNrdx9e+jlVxodH0HU1GKJ3LPJqg0cOvabk80MVisJVEqQziYgNkPOrvBG2
	xtVyh34s+C8rQP+ek4WVEDMHzBW93RMs=
X-Gm-Gg: AYBFou0vaJcaJ4JX40xB+ZKSj249zBdg5gOruK4Y52T4wQTqB0zh6uVVv5xOgmtiDA6
	yo9Mv70swTmxEgymsggl0N4bGcYUDQKhlLS7gAOLoj8qkxCESHv9e2r169dzYyjdqr+4BTkAKee
	7oOCrkvqnaxX6w7oqD+NJ54U/jogI+LVb6PcP8sdtJNeNLgpgwp01t4Gk2imd+X9whe3kVGJnfs
	+H0uvLHSKwC4kpYr3lbwbJFKYqykIQNQa9Qws59aQmKWHWXC8UGf40jj3FHJhmFckjCKxwBQgXO
	ptA3oBR+5UixsWcptzFZSXN7xXPyNSRb6rZwPQ8PjYi5i0ycOGKGYgBQGoXitiSN/qCzsjvktNm
	2aReahO7qynKoHcbbDZ3Z7q33/0ByI8Evclgn9m+h
X-Received: by 2002:ad4:5748:0:b0:912:517b:40fa with SMTP id
 6a1803df08f44-912a801bee5mr35579356d6.44.1789858618635; Sat, 19 Sep 2026
 15:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919083655.586922-1-enelsonmoore@gmail.com> <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
In-Reply-To: <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 19 Sep 2026 15:56:48 -0700
X-Gm-Features: AcwNN1UGTDJgGcyXU7D2JaYejEQlWEe1KXFmg-_RTnPu_ebNdg98jhIE48FePPQ
Message-ID: <CADkSEUigNMbUi88zOCcLkTNduYk_z-k5bushv3nUAL7vGdCdEQ@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio_mouse - remove driver that has never been
 used in the kernel
To: Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andres Salomon <dilinger@queued.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Linus,

On Sat, Sep 19, 2026 at 5:12=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
> Why though? It is fully modernized and probably has a value
> for people like "makers" who just want to connect an oldschool
> mouse to their random Raspberry Pi.

You're right. The driver is so small, too.

> I think it's better if we focus on removing code that is just
> using platform devices and hacks and is hopeless
> to maintain. For example the OLPC...

That's a good idea. I've started working on a patch to remove OLPC
support - at least 6500 lines of code and I'm not even done yet!

Ethan
