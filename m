Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431023EAA6
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 04:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790828350; cv=none; b=qZ5iOxLFQMKLFoWt9zFgO5xdNMiWn7F59TTlYRMJ7u9/Copnnvbn9JpSZ0LB6ksyuGfKKYVDqdHBZUFgfeK6ed2X7G6vMMAaYFpRc/E9+b3K1cCo6gLDcDCqLObQU7PWqi1tb/3jdjHLGBKro5bVIt5lzzZN8XlltSG4We9fTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790828350; c=relaxed/simple;
	bh=fIM13QEFlmcI9y+ExG4Tih5mXaHroRUcHVgG/rxTxl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dx0ZjIkKsPzWcDiKD/Zkvrw5tOKlM2cYu2JYeNd50LBOMGcJQ3hGFZPPfndSslS5spS1uTV3IF6fiLPW897HpZUuLlbMoq4weJUAH2S5gb+47cJVXLFlajLGcut3yQ1Tx6GsBxc84pfaNd3l+7tO7u6uBcCgOX43ZiqmCrjEzbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNPSpOC0; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNPSpOC0"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so3780413eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 21:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790828349; x=1791433149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIM13QEFlmcI9y+ExG4Tih5mXaHroRUcHVgG/rxTxl0=;
        b=rNPSpOC0046BjPIBhf0FvKKYMBinE/zoK/GQK+x092mKtmZ2Irfh9qz0nTi8J5DaI3
         5aUjrAY5nDJGLai8Lf20LqypGGlWc64RKMW+7KLUpKjfFFyD2ox5ellIqojsvolcA8uO
         +zh00lfncWudq2NEi91wAZr1Lxu+M+v0LO7rSxeo8vuxAlxnEX5CcyeCNmHQo+8RzQll
         nU7CPO78xPV2wCFFq21128hmoZzWE6hGjo6gRKYSCgEwesUReyrR9UPK7KkqRy3Jv0r3
         jILrSDlgsFptRt+rBm79T2NHFT++VhMB44ArRhOuOI5mpEn/e3CVehEzZqEFrKrSvbqk
         UEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790828349; x=1791433149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIM13QEFlmcI9y+ExG4Tih5mXaHroRUcHVgG/rxTxl0=;
        b=yDIzQWlqNZdtQmkOU7un0rrH6GA3W0LQkYKLOyh4tVkwFC6KtSWP422W4JxkUD7iYR
         qEbNNlAJg9UPWrNunNpIJIwjA7NQ9SS9ko7erclzwN+rMazSmXIVa+hB/d0Z2uAtHonI
         cH3s199Oj7lq02REpODt9f3LilwCPvDJi8l7RBcqAfVZxW1i7CtOZ88SPXPLId0W1U1C
         8xYM7jnGnMnrxYX4+XjAhY8cdHH4xT28V+B+bysGBxcOdB1TWsYVDK3IZzCGdlLsfDSZ
         /S2sWiWG8L/T/jVVV0eKjAvrvhMhSfmtWVYZaTsQrr0HwdZxN86pNUTn/6EEYs49vAbB
         OURQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaQOYjos3DDOmpZaQE2LHUXAwVMr5lw4pem2jOTjuItKQ8zaA1feUeWjAhpa+94v67S7e+7t5U7WBj@vger.kernel.org
X-Gm-Message-State: AFq9FYIqWCl+tQ2CASCs/lVuxgtL451Gr4ijzm0myOJFr0b5TXvUeGJe
	JPBxSejm0EWtJLiYE0cuT7k1HGmDC5KJ2u9/eR/aC2Tr+s0Zm3dSuDsr
X-Gm-Gg: AYBFou0ezBGLSaCJKX0hC54yRWxACvl7Q/8Wbew/7lEIEHwaOrx7JVslSeTCDakvZyd
	ncwBmRn/9hxIVUpJjyzoNA7ulpaN/e9TFP44qKft7bvgTMYmmiza3bVRisqgJWNxVCv8MxAGl5L
	rntHnwr2c9JXaRPGAI1MNRi7Ki8xqY83ynHlA+sI3z5QN8HEzUxdSoKPBaF4JVfIYo4y80T6pLs
	yQWkAHBj0/sXbyLbjktXcBfuU7U4ML6LZlRhpf0e+nSLs4WvFXOsDy6d4WHz2Kmd/H7YDGmJyxs
	H7yCaQe85u/k2BX1IfR/IfWzz8K8+HZtp6/O1kEKdk07eMTQCHKKwtOrKqdmdXUV3Q1QWTKv640
	JoYNssv7dGNHsKxmRDvY/jBlxeG0jcqNTcruS3MfTbchVmLC/g0rMCyf0M0odZcX4FE3NpHv6+i
	vVcvKkbDaAcQ7N5mzKdmRFnFGyj+/ydlr3TnZryn6ztkl04ttPtnCOxrhKv9Ty21+2Smol3q11z
	BvScDuhbPBJjZCsLSlMomcW138SJyDStLJA3RmI8PDa5DRPg/ki2mtgpslD6wg7knIvhjiXrZrV
	OXT44P0YpGVrwZPwyzDbswWQnPepiCKsjv8duA==
X-Received: by 2002:a05:7300:88:b0:34c:3ae5:c280 with SMTP id 5a478bee46e88-34cdb5f92b7mr3311931eec.10.1790828348454;
        Wed, 30 Sep 2026 21:19:08 -0700 (PDT)
Received: from rahuls-x2elite ([157.51.37.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db315e8ecsm3877424eec.6.2026.09.30.21.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:19:07 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ACPI: GED: Support GpioInt event resources
Date: Thu,  1 Oct 2026 09:48:56 +0530
Message-ID: <20261001041856.1984-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <CAD++jL=45ZdTbHsLDTAmTt3f+=VBVK014TLJyd5Drdba3V=dSQ@mail.gmail.com>
References: <20260930111505.1108-1-theflyingrahul@gmail.com> <CAD++jL=45ZdTbHsLDTAmTt3f+=VBVK014TLJyd5Drdba3V=dSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 1, 2026 at 1:52 AM Linus Walleij <linusw@kernel.org> wrote:
> I don't understand the patch at all, but I understand that Andy or Mika must
> review it otherwise it's not going anywhere, so looping them in.

Thanks, Linus.

Andy, Mika: some context that should have been in the commit message.

ACPI 6.6 section 5.6.9.2 says a GED _CRS contains only Interrupt
resource descriptors, so this firmware is outside the spec. It is still
the only source of lid events here: LIGE's _CRS is a single GpioInt on
the GPIO controller (pin 960), and the controller's _AEI lists one
other, unrelated pin. ECGE is the same, with pin 768. On Windows, the
in-box ACPI device driver (acpidev.inf) binds both GED devices, and the
lid works there.

For _EVT, section 5.6.9.3 passes the GSI number, which a GpioInt does
not have. The patch passes the pin number from the GpioInt descriptor,
as section 5.6.5.3 does for _EVT under _AEI. Both _EVT methods on this
laptop ignore Arg0.

If the approach is acceptable, v2 will state the spec deviation in the
commit message.

Thanks,
Rahul
