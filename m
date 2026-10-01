Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C036F90A
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 04:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790828837; cv=none; b=JfVZWYf7V7sb+dkcnPxIAObfrPZUQ+S+Dg1ATh2x8MiyOlvY3fQtFVgL/92EWkkaBhma4EdmjaeqnbQkyVvaI/Ucv+cguGvQlznKVTj4lJMUkJAp4i7vtvvKkFQcB2UZ8clORF2kdyjWTPsQ5Ez5knun0HoplYtBIADI+zVnti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790828837; c=relaxed/simple;
	bh=rPzbXjcoFnVql4gRTl5oLUsjZaMf4eenmRAkOFsr2S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUthDamH+BhnLghzbsGHvASQHVwZg84QaHubf8X1gFyLEIhv6AQ04LO9K7DJs8dNvrCkZW6KKHSckH1oq4SOorCOLyEXYdePShII+lzAvGZUiNVIzSWWB+8Vnl6m6dDQ8T1h/gbuqXFdGSeHZjLL/VOENBosw9biI5tXhOgG5NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Idk3mBrF; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Idk3mBrF"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04edb5so10185116c88.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 21:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790828835; x=1791433635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9A6rq3RuonmAhdkjSfW3Ew3B0bFGrJGb84aoG+EWNd4=;
        b=Idk3mBrFrorc1gkiTROhhQl/g3ANI6APcpd3kn82RAXZncq3ucZ5mGfW0KK3k9Jx8O
         KxgdfuLTt3BsdecHqjPwD/WMjmh5MFnkJrMAHyD6qaLYIQc3ewCpZNjQtP/wj+WV5rti
         6i35GTWaDhnJbgyuVvOGqqIbUpsdPzuVZf+zlC0IyqoZUzQ0yS+0AO6ovb/ZJ60++1qS
         fQiuR42bdCxs4o9VLg2tERvWaEJ1jlYpbAnnGyf0x6ObyZ/dkFH4vDeIW3ONXxVHqCAQ
         ryovsoAWAJh470eCFFMgbe39CYiRUkckrGA0YhAU4pPHoCCKg3xRZkTVDqehNYwdf+f5
         9fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790828835; x=1791433635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9A6rq3RuonmAhdkjSfW3Ew3B0bFGrJGb84aoG+EWNd4=;
        b=sNbFD10O91WUX8jfiMm6v2e8RrpvgMIDoXUPRkTIzjl8frjj1zFoK7pRycJ46pbmEv
         zjdwUvynyFhHgUmC7nrC60tn6s/0mpEV+/1u9JTzQCag6T2/WibGdzHoV2hYmS7wmu0h
         wYanKV89YDhsZgU63bgS6JQc43RFx82uauhVgmEzSxUnJMhw0Pe4PKv8Xd39VO0FYMqL
         Oeiw9RhlK2Ev/waAwotM+ymuLaWh1dCwG6YHdgcm93QWdi9PGUpcE9aV6XvxVl1x6f2N
         ThNS1Ni15ZaYhPYCtOrTbuVIO4AhOgZdYm7C7x9VwN47Xmsks1HlmpkKyx5SBRH0hbEj
         i5GQ==
X-Forwarded-Encrypted: i=1; AKwUvByZcEzyfa/gtN3ec3Ss0e1RwFAu0FRSpYWuCXkQmD/JMbmfcvt6aRQRu4pWCKOX0/efynOB1FPYUiq5@vger.kernel.org
X-Gm-Message-State: AFuF++n3D8O/QG9XFfwDO733oDE+59KMtzK+RLFOZF+TTKZfsL/FKRjj
	I5PNnmJdP18I3ZUHWcyGT+36e1RPCTy8SvaD0XLmfBms1aRcleTnWROn
X-Gm-Gg: AYBFou2OHtQN+ceBdV2XNJnfXUoVCaKFTQwbtx1+NNnIOLvMQ7j8xLa2sUY9m7Qrhd4
	9IhySd5Pj1h4bqc5Vdp11vtALy9dMoOFNpCWoZGERPok8tHDFR42lcnhQtOtUOUj2rdMH081IyJ
	MxWV2xUG3QyT1rdIesLVMD3te/KUY7lLCNZxSY4AW8FPW3FbzfnhsIvpfhbxQFSBlb/fqM17O1c
	Zskdf6T9t5muJCNpEHMi87oU4IKZALCke4VwnXRcxim68G3XIsJHorm1Ym1xDldutNwn+Qn7Xyc
	iiuQbXR/LLBsFDHsk2/1q8VFKh91G3p/Ob46nd8cMHHL14Ou4fYwHyM9pA+5oGApZSzsBKR3vZ9
	NO4HOblY1fbGqdh/kFOaiLpS09V1bBreXF2s6o7hvD/LL3weBfBZreKloQFIgbKsWl2G4vGxeeA
	8Sx5np/yr2nObRJAnZ/qlIkkhPtlYiegPCsmQvW4JGWkCfUMT5aVt8uHRu+T4pfPhRGG7S+bL/b
	RhIWqTZYgr7ot+eB6OE7rltSGnjw2TgsHQ3zKjhWZZpLcTu8eVHUX/Aj2OdCuv73FAiYpOUQemq
	dO3gVaa2htjqYEH+Dp9oeaV9rm1odQ4yZZNJ
X-Received: by 2002:a05:701b:2515:b0:13c:ec65:7bca with SMTP id a92af1059eb24-14d31f58017mr4110288c88.13.1790828834553;
        Wed, 30 Sep 2026 21:27:14 -0700 (PDT)
Received: from rahuls-x2elite ([157.51.37.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df44d4f00sm3637768c88.14.2026.09.30.21.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:27:13 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ACPI: GED: Support GpioInt event resources
Date: Thu,  1 Oct 2026 09:57:02 +0530
Message-ID: <20261001042702.2249-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001040420.GB176164@black.igk.intel.com>
References: <20260930111505.1108-1-theflyingrahul@gmail.com> <CAD++jL=45ZdTbHsLDTAmTt3f+=VBVK014TLJyd5Drdba3V=dSQ@mail.gmail.com> <20261001040420.GB176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mika,

On Thu, Oct 01, 2026 at 06:04:20AM +0200, Mika Westerberg wrote:
> ACPI GED specifically is supposed to use interrupts only (hence the name,
> Interrupt -signaled ACPI events). I think this one should really use the
> GPIO signaled ACPI events instead and probably just has the ACPI0013 there
> by accident. Can you share the ASL around this device?

Sure, below. iasl shows the _CRS buffers as raw bytes; the GpioInt
lines are decoded from them and recompile to the same bytes.

The lid device:

    Device (LIGE)
    {
        Name (_HID, "ACPI0013")
        Name (_UID, One)
        Name (_DEP, Package (0x03)
        {
            \_SB.GIO0, ,
            \_SB.LID0, ,
            \_SB.IC10,
        })
        Name (EEDP, Buffer (0x03)
        {
             0xFF
        })
        CreateByteField (EEDP, Zero, STAT)
        CreateField (EEDP, 0x10, 0x08, DBUF)
        Name (LIDG, Zero)
        Method (_CRS, 0, NotSerialized)
        {
            Name (RBUF, Buffer (0x25)
            {
                /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x1D,
                /* 0008 */  0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,
                /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0xC0,
                /* 0018 */  0x03, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49,
                /* 0020 */  0x4F, 0x30, 0x00, 0x79, 0x00
            })
            /* RBUF decodes to:
             * GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x0000,
             *          "\\_SB.GIO0", 0x00, ResourceConsumer, ,) { 960 }
             */
            Return (RBUF)
        }

        Method (_EVT, 1, NotSerialized)
        {
            If ((\_SB.IC10.AVBL == One))
            {
                Sleep (0x05)
                Acquire (\_SB.ECMX, 0xFFFF)
                EEDP = \_SB.IC10.CMB2
                Release (\_SB.ECMX)
                LIDG = DBUF
                If ((LIDG & 0x04))
                {
                    \_SB.LID0.LIDB = One
                    \_SB.GPU0.LIDB = One
                    Notify (\_SB.LID0, 0x80)
                }
                Else
                {
                    \_SB.LID0.LIDB = \_SB.GIO0.LIDR
                    \_SB.GPU0.LIDB = \_SB.GIO0.LIDR
                    Notify (\_SB.LID0, 0x80)
                    If ((\_SB.LID0.LIDB == Zero))
                    {
                        \_SB.WMID.GWMT (0x08, One)
                    }

                    If ((\_SB.LID0.LIDB == One))
                    {
                        \_SB.WMID.GWMT (0x08, 0x02)
                    }
                }
            }
            Else
            {
                \_SB.LID0.LIDB = \_SB.GIO0.LIDR
                \_SB.GPU0.LIDB = \_SB.GIO0.LIDR
                Notify (\_SB.LID0, 0x80)
            }
        }
    }

The EC event device, ECGE, is another ACPI0013 with one GpioInt:

    GpioInt (Edge, ActiveLow, Exclusive, PullUp, 0x0000,
             "\\_SB.GIO0", 0x00, ResourceConsumer, ,) { 768 }

The GPIO controller (GIO0, QCOM0F0C) does have GPIO-signaled events.
Its _AEI lists one pin:

    GpioInt (Edge, ActiveHigh, Exclusive, PullNone, 0x01F4,
             "\\_SB.GIO0", 0x00, ResourceConsumer, ,) { 126 }

Its _EVT handles that pin (0x7E, a Notify to the GPU) and also pin 0x5C
with the same EC read and lid Notify as LIGE's _EVT, but _AEI does not
list 0x5C. So on this firmware the lid is signaled only through LIGE.

Either way, please drop this patch, and disregard the v2 plan in my
other reply. Looking at it again, it has no upstream user: GIO0 has no
ACPI driver in mainline, and my lid test used an out-of-tree bring-up
driver for it. Mainline supports these laptops through the device tree,
where the lid is a gpio-keys switch and no GED is involved.

Sorry for the noise.

Thanks,
Rahul
