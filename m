Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E964C6531
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830507; cv=none; b=A0xvPhYnTD07uINmQWHolmkdoaaZdYRSybRQgXzgGUGHikr9VhqhLfEK8+OSek/9wFax75ptoecaPiLpMpkWlbFznd4dfiQCGQwhVVydOQyDnjKR5kWvcjHBlhxndINVgQ29L8gATfO9dd2isaC9lHypg2XNxdDFQBBlGapgVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830507; c=relaxed/simple;
	bh=OJr4F+tRV0On7Irv/rawfuCiJMAnPUX7BfkuP7XFgsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCWJeyvHXBENVyYbu/K1QEeehAY2XiIwgRETV4s+X1D97U22uDJyvkhkh8Bk7+RYqRVpi3Kd/qK2YPKbbYU/2Sam1LAhtTKaGBTL/GwY9j+dD4UhxKbl4my9BFnmbRCEkQUVDfFijpKuwEl9/MzPacnNGfDarerdMTvIJwv7jG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcqrapjl; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcqrapjl"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-980c4258105so998374241.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830505; x=1792435305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=gcqrapjlMlahksyBmjXYnNSh31y+H31/MUknDTGUyXGwyqINyd7j6W2K+5acAa5zTq
         cMKmseABjOg6HkM8XQwjpqcBRqDAGzY4ftqLg59kZ7LtxZmX69uC0JMzgBd+brY+J6ZJ
         YSxre2go1IP2dSgWFzX2DYR+XVLb+fbeEBvaL8ppY2d9RkPhuHYH30LGQIZwpAX3WkdJ
         9qplQFPuTO8NTvXAeScz1W3Z/eefIR/NB0GCzCNWjFCqDTEbtVOHEeHEmx3Bwiu2a7DU
         pgqRzFi+IQlz77hpbi93cThVFZNmf/KNXJalYaKjPwS6qONUPvyWoomwMMkugefeWXdp
         w6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830505; x=1792435305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=Ho+ajkiIZ55PXcGP4+FINZ9R2NuqILuhn+5wGBVxgOoPTGTPK3SUVdnNBdbqD6wA+7
         iKoCPZyTaibmHc+j/dxeoW9cHu8guHDi7BjGXsBbjDRkC00g+HpepKmKIRPycxpN+DlX
         MJCyICDL3zzWBdOzczkERyNl7Tpt1/GONwNIeZ595pPLPMzAb4Qmad6rfbxfT67rKj0/
         KGoXmJyDQjbukY9IUGBudTvWr20q12OfRfCRNpHYnh71Y1QdsilAjOAZNsLc3ogFmZ3t
         XzBCLA419Pgp4GHCU0qZ1WyyeFOgmWNr8iIGTKJFuqDBqJJ93laWvgNDcKEGjzt5p37C
         sUbA==
X-Forwarded-Encrypted: i=1; AKwUvBxhYuehAKPjJ7hCI8snMg4RlpJ8003cjdTlgZ2gSFCQ7+c6paALKdKMkjAtZnmaCL7RUmiPb7lDaBkB@vger.kernel.org
X-Gm-Message-State: AFq9FYLi7gFGRvrGzP40PYVgjBoWmheeUn9NDDA6Ssh0tNlkDyzB8A97
	rt5YmLcKu5phRyZdRtivyEL8uOe9cne5LSjl4DT5Jt91qOHb7w50zzb5
X-Gm-Gg: AYBFou1sm5IxMHLi+XQvsbAMj5vLp+pw7veeUnqh0iWwTyAIyC2Zi3+jjUp3r1reQPk
	1AI9XbCoA3tbivFaxuAMBc0QWBywA8/VDym8oQiBO3CObxoL/maKsZsCGauxtABKKD5NcJu7aJO
	Vskoif+OuS6ZH2noSnOp3UsKjKGHpyQzqMnxOZ5IjSdtYHmfKnlZqnCax3ZRt4uAzqDnFabKf8W
	Pjfw0P0Jc5CQGI3hKW/6xv45LC000Aza7GC7sceHDWOQcX54khadvW4UZwh3Wn/vovDt25nxPzn
	1vJR7Q5SJao36DjL3vw1AyXvMLpNz8/VprCnmsKvAqOeJ8OK9XHxKT1Pl6jg410keI+PnRn4zx2
	cLGkAITGzjUCXn1+pF2rt8jOTGCjuZDapmiY3gGiaUosai/aUftOXFfFvpx1JsekSe4ygoyHxVQ
	6VgSKhDM0ktASKTdKqZ7On6oi7C6aWQJgY1jZ6N7aDS8NmCUcBP559f1Z+HSw/NiCp3xu5vGLRl
	D0H1cHBSpidAxDeYZmZH4yuxvJTKU9WL0LyfTDncva8A6nhBaoHYlt3im6S0xIO51zhFSlvm5yX
	KGkwRzMTO8G3R4gurQ==
X-Received: by 2002:a05:6102:80a3:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7cb37405c7amr3420126137.33.1791830505277;
        Mon, 12 Oct 2026 11:41:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:44 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:27 -0300
Message-ID: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this follows my question in [1]. Andre asked why not extend the A733 I/O
bias code to two bits instead of switching it off, so patch 1 does that
for the main PIO and patch 2 gives the A733-R its own descriptor, as it
cannot share the A523-R encoding.

I have not seen the board fail with the current code, and no A733 board
DT upstream uses these supplies yet. What I have is the old and the new
helper, copied from the driver, run on the host with register values
read (read-only) from a Cubie A7Z, silicon revision B:

  PIO SEL 0x01155550: a PJ request at 1.8 V gives 0x01155750 with the
  old code (PE goes from automatic to fixed 1.8 V), unchanged with the
  new one.

  R-PIO SEL 0x000aaaaa: a PL request at 3.3 V gives 0x000aaaab with the
  old code (fixed 1.8 V), plus a read-modify-write of +0x344 that the
  manual does not list. The new code leaves both alone.

With both patches the kernel boots on the A7Z (RAM boot of an rc6-based
kernel): UART0 and MMC0 work and the voltage selection registers are
unchanged.

PF and PI are not programmed, and neither is any silicon revision other
than B, as reported by SMCCC. The A523 variants behave as before.

I found nothing to change in the DT binding: the a733-r compatible has
no a523-r fallback and the schema checks pass for both controllers.
Andre, if you meant something else there, please tell me.

[1] https://lore.kernel.org/r/20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (2):
  pinctrl: sunxi: a733: program the two-bit I/O voltage fields
  pinctrl: sunxi: a733-r: use the A733 I/O voltage fields

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 ++++++++-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 15 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 57 +++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  6 ++
 4 files changed, 101 insertions(+), 3 deletions(-)


base-commit: bdacd2542f3c1b2b411fa86ee1f39de19cce6562
-- 
2.43.0

