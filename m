Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E63C4174
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 21:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359407; cv=none; b=FtWcBZBHBpvjit9TXK6I3c0Z3Rpj6b4zM8dcsMI9miHJrOlvGjza/UIx19JW2a6qy2Ab0dSIPbUIUyrc1EQ7RbsfufoqOGqzqEitYBywQJErnqGIr8OgP6q2c1utgWjB8+Lsocxn7qcmFDM/B+OpIx1wCW1ohS9vpHmBDhaocKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359407; c=relaxed/simple;
	bh=s+MqZ/Bir6/vaed/O//RDRbCUNv1Kb4jVJFl7dfpI6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTM9pb9iVPowq46BEbkAir6SyrkMTsSFudrlSJJDydKDMveneR59Kzykbn+w5fYTLf7YVxzpHf87NZOJO1GLKx7qEfkYHjVs+qqOkz3zWpClgOW7bIkyK674dW7YQ9TEl5seXQHhIkfuAbgJfK5PWj8+fdUmcblX1xo5tK8atpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4NIIy3l; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4NIIy3l"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c149c5722so1083421cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 14:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785359405; x=1785964205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HT1Cjjehq6Vu3qcgGIFgM95C7sZbwZUYcRRiTOvVJaQ=;
        b=R4NIIy3leKdN1xwOencA8AsmubUOFa2+w/Mj6Mrxg+ouYTQLJ3AdU15HQM3Iw8FDJI
         N0gsIz56Vb41VZAEBKtALgBChL53/X/qjQRxbXyCRfvjYlREftIt+RpcfxqPJ6dh2+R0
         Lh9TEVIHTYvSLjHy5zC97sCAsJDYdMZ3nxynUOfHdw97ek2w2J8S1WMeGyl4ILEbY+1T
         tjJ80j6LyED/97IF0wylAMX9M7loZ+e6RfJKAQfnC/NBsgjL/JQsIxYVBEsshSrF2oae
         +x0e9nS+/AXU5EguOyUrjI0fuZjGzcbGX+x41gsUz7+tRkRtJqR4Z6LzapR0tBTPoOT/
         E7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359405; x=1785964205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HT1Cjjehq6Vu3qcgGIFgM95C7sZbwZUYcRRiTOvVJaQ=;
        b=CdN6nbHjyhJzS+lEd+67YnpiSMgkIGNNhM9+4+WmhHvaLPEOUKjNZDyyXanamSYPnY
         A3oPnz7+Wm9NlH8bg9p/IWjXpT6VLKvbtEdvM+aUMDMnt0l56vFy7wTk5sQX1xFcJf7q
         eZ9ewSBJzWHCRSzB3LNn3/oeEk7GXX3w6iEGjQOjBD5yQpAF4TJxgIclTbGzez0PtzbW
         GO4OM7SSl8ruu2RhPcs1xVK0VfKrXlwGKcNqq10z4mz6PR/OVZoBBHxNZ6LjmLs+285T
         N/Y38vA1hvmPUQUiff2101nrsd3d1aVs7ts9i/WNTDSjmXvUIhBNXkr+s3af4qaPm7Ev
         P8gg==
X-Gm-Message-State: AOJu0YzP5a0NK7grgu407Tx+7l2sBJEPQwqxTLt/GShi49y7/kOIwo7W
	IZi1O/QoUz6bQqr9PzhGq/W0nVL86k+StYvtxiyd41fMMKcom0qBZzdO23VBiNuT
X-Gm-Gg: AR+sD13IzEz9pcGQMa6JLlrrwqgjkvJssqrKusT/wpTaT7kOAsmboQyzduOvZN/f7zp
	RGxtlrN1x79VyV+4PihTAmcfKdBseCBEEBBj62R6+SuxLrOghFGpvOnP/NlTNvgsUFU+yErxKRe
	zHSqyNNPRyjQ1lYlzFOLYFT1bw01s8TcD0cdsEAMftzCKgSu9tPVQV71A6QW3TVN1U0YqW63N/c
	zZ/5An4wvnBEiZrq/egb95GXzsS0+kGTLMhtBnVdjm8tXJZ64dsCaIk6iRPV9D8XHj+iHkZzz8u
	7YC+4UE2BAsk7khGNCbLyxLFENJeI8oALvjH8B3ZE8zVzdoZBVmf4SJX3wwfMc48e4+HfIhjzhy
	FwijFAGRkE/I6fAyxJUTzbB1fXnRwLPOarDSuAQTB8Lfa7AlZs/zAX5N9FRheVTooqt0U15m4x4
	HauJ80D8FSFVe5cuSB7ieuPhFjMiqV5t+IoRR8dE1Yo6qwF6Ma5HkYEipllYsnZLQTJ3lO3gz87
	esiBxBQhbCnSifiRrco9rrsSltOfLf96kKbvF6t6AgdSWjrs8kQYRMNQz+zhqOfEN88FVOJNX+R
	5299e1iLrpdDG4OmLmWoHBcoBbqiLYb4LJ5N/A==
X-Received: by 2002:ac8:5a88:0:b0:527:7122:3f2f with SMTP id d75a77b69052e-52b2ae322efmr33800321cf.31.1785359404624;
        Wed, 29 Jul 2026 14:10:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd6a4b9sm32961786d6.39.2026.07.29.14.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:10:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: allow COMPILE_TEST for IOPORT drivers
Date: Wed, 29 Jul 2026 14:10:01 -0700
Message-ID: <20260729211001.719606-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers are gated by X86 but they compile on non-x86 just fine.
Add COMPILE_TEST to the menu so that these drivers can use it if they
want.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4c02c56f6748..a7b18fd59110 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -954,7 +954,8 @@ config GPIO_IDT3243X
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
-	depends on X86 && HAS_IOPORT # I/O space access
+	depends on X86 || COMPILE_TEST
+	depends on HAS_IOPORT # I/O space access
 
 config GPIO_VX855
 	tristate "VIA VX855/VX875 GPIO"
-- 
2.55.0

