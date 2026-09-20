Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A566E3542F6
	for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923623; cv=pass; b=rkVmEDUddudvFxgSiixV9zLsx9JoPDZKtfjUd3TRcRZQfM6b4I5l4QIrZwHLBs8iaPqVtMuDmn+scYWhVqbUFNF9nxYScqBdOHDtSbibVpJoj+n80b89VIcRGhO8bGrQJShbBlj5Uoh3UUZ8vHMtQTGVEF9/bnnCyIiIdNvRa/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923623; c=relaxed/simple;
	bh=FOYRk6VydLS9eMfMxZB7qHkZwQsdY1XIXbZky0pHTu4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YNa5ZyVA3QDjV8c9civoj5Dtfv1zy4/YdoBjxC6u/KTxvvby3mdQEi23Waujov3brO48HGQJnkWeW1A+FWbQZgs4FgJUddgoTwV428FPbDfD5aDnkrFcdMPziKrPbNKkQxhjGEk55J9xxuEuLqXojaOKJokhUxVxXb44dv45Zv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA9VsgcC; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA9VsgcC"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso24768025ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 10:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789923622; cv=none;
        d=google.com; s=arc-20260327;
        b=aeLCYhO/2mLecEsN1RZpOmcfFvQjt6bnPnLMNrC3C1ZG10Z/AS3JERnbUhaDzlX3oy
         zWUtx6eNt6QmVy0+FkhWPGxUiKNv68B9xjW0qPTgssHyz7kTWyygqHZlpUzxX0QTec88
         c0mobrqb//j692gadbmAa+f97DPHDaAiWDEKiIRg+8hjmZ3gkUEAiGeZ/4koCQesBlyQ
         2UhwdfSuhL8td1oqravtTz98XsyRYlDVeXyfPcxQ6baJyxnTyfFBu5XX9/+cM9cIUXKc
         wTEh/tsohlHB489lz+wSXgPc1Z4D2VnfSeU8CJg6n6THaMWnBpMbV3N+sMj0TEtAi3TV
         ubFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        fh=YKzwPWbJw+v4DPgOgzb+fEvxqhA093fZe3W/3qxZmEU=;
        b=ZSCvWeuyGimQE9EJ+1qC6M02NQSxeRkJTvwExDu/8m6c9lkdLzFf29qifyxTR7pUeA
         y/J+QJYJEO3jUyxnwBM4/r5eoeodOhoM/b82ppMkfuDyQ9xkGKnrNZ+ZJ98hJENWxwwM
         jrUdvUhKF8DupJReCXWRiW7jR3Z9azI6LvuxJtNWbGKqbkFdSbQoTQ7+I2k9YvOiRyN8
         uVrbtkTxD9uCB7QEqadD+xBJopTo98GgPE7f43tDVCP3CRsAC9zFs6oCI4HQcs1YdpNz
         2uRCXEvjF8iyqn6yzfIbdRLmQlTQb8GsGkFSFKaYMkW6dIB6BZIAAQ4ihfwz9gwGzf49
         M1Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923622; x=1790528422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        b=UA9VsgcCqToHdRF0sooEolzQbjhNwLzDTaG1lAC4pymvLLne9NvxY9Pf2SoRXSqzrL
         N0d1XYt7GBa/sbf4X3Aj4jA59yil86QuJz6MtVf2LIPy21cjfxOsYbiZAxVJ1+f23rtu
         bkhaYoTJ/ceFY9lnJYxUVHNGmL5JY3deB2vgnw9fw5yYK5lmfaDq/CDDRPMz8Qu7jied
         plTHskkuhSgV+K02scTMNP5Eo6VCFl8B169TTZRyPTL4A4bxo1mJzF/IkqGqWx/VdGVc
         xMbOM/pyYITSmS7cI6Ylmaxn+VC9bwbAd85tzBZiid4BZDSHHv7s1MBaiPlwRbxg4HvT
         Ghsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923622; x=1790528422;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        b=2UUPLE1IdBTZ7v215N5Sd9HdtYsFrgdsmxbjAQKOCoKR288P76DtvvttxhEFW5JaOf
         60RvquoW3I2AqB1nGvHmIc4x4Gn++/XBe09bCq9odPW15Ai5Ru2dOym8FR0T1KEw1ZmL
         LGs3oJ57penR9oN++YstjE7SH+EteeJ7Njmwx/TJdHTPuYF/OnCXM5pM/A4S3dVQKf1j
         UG9yIFOPxqgcbtXd5V1txa8N7F0G1l2AoRrbHbwxiDv+VasbxTejs/wDtb/sq3F36mou
         EqTgL8iv4YZqF6fg8QQWQvYxHUtFVKJdWMGANE5mJ3O0f/K5IbAkg4e3Rey+B5Ka5MPG
         hMAA==
X-Gm-Message-State: AFuF++nOjBSlaHIs6ZHit7s2kfjQl3Xfpe6f4s/PzOctlWoXnsgsKfd+
	pJCbQJJWf2OdbpEtDZ5FOgFuVTfNWso+8ZabvJp8fGQ5yJ3jsoS1/Z5+ySoiC8gbYi3ILHWfjS0
	eXNLIoyqU+oUkfHIdDO+ljSvcWYkJGyY=
X-Gm-Gg: AYBFou10KMD8/bBajYanu3o+lrYk1R9Py2RJPF5yFbYDH01Vmhs4BjwwMqnX8PckBRg
	ryBCIyHaGV39Xb7G56rvpL3T1VdttZT8frz0LweKFZ6sa/NnuDROkXCQkFqwB3J117eooauZWRb
	Z+tPb+pIt6fSzAvn/i2v1//GQuTEC4EdmvcvMKUYo8Iq3ShPjSYL8YZKZYJSfv5BuTAPiMqZ1rh
	WLVnwG2mjGfw5IcknJQixZHnZ+2568GHotR3rtj0i4XBgcijjiDbpYwy+j/yqIH5EqmcLnK8iZ9
	9b8MUTr6moNbctbRpBHI7QYkp3CE2y/+24xVETTX++jGDLbRVnzR
X-Received: by 2002:a17:902:f545:b0:2df:3f0f:d65 with SMTP id
 d9443c01a7336-2df3f0f0e1bmr26183525ad.22.1789923621367; Sun, 20 Sep 2026
 10:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Olzhas <marat.olzhasss@gmail.com>
Date: Sun, 20 Sep 2026 22:00:07 +0500
X-Gm-Features: AcwNN1XtjfcG1A3vuRXuZwWNFiaCVgATiKsMbPLyoi8g9WObhx_BLl_2Vjqsho8
Message-ID: <CANzgjV0YWUX6=ZGTbn4KEKqQmVhsZTsDPeRf0Nfq=YFT1eoPzA@mail.gmail.com>
Subject: [REGRESSION] pinctrl-amd: Don't clear S4 wake bits at probe causes
 power off to reboot AMD Ryzen laptop
To: "mario.limonciello@amd.com" <mario.limonciello@amd.com>, linusw@kernel.org
Cc: linux-gpio@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mario,

I am experiencing a regression on my laptop where attempting to power
off the machine results in an immediate reboot instead of a shutdown.

The last known good kernel is v7.1.7, while v7.1.8 is the first known
bad release.

I bisected the regression across 9 kernel builds and identified the
following commit as the first bad commit:

a7c855969b1a ("pinctrl-amd: Don't clear S4 wake bits at probe")

With this commit present, running:

    systemctl poweroff

causes the laptop to power off and then immediately power back on.

I reverted this specific commit on top of v7.3.0-rc3 and the issue is
completely resolved. The laptop now powers off correctly and remains
off.

Hardware:
- Laptop: Chuwi CoreBook Plus 16
- DMI board vendor: Default string
- DMI board name: Default string
- DMI BIOS version: AB8139_S_2C_V00.01_007
- DMI BIOS date: 2025-08-05
- CPU reported by the system: AMD Ryzen 5 7430U with Radeon Graphics
- The CPU/hardware appears to correspond to Ryzen 5 5500U / Lucienne
  silicon, although I am not certain whether this is relevant.

Software:
- Distribution: Arch Linux
- Last known good: v7.1.7
- First known bad: v7.1.8
- Current test kernel: v7.3.0-rc3 with a7c855969b1a reverted

I have verified the fix by booting the reverted kernel and testing
poweroff successfully.

Since the DMI board strings are generic ("Default string"), I would be
happy to provide an ACPI dump, dmesg output, kernel configuration,
bisect log, or perform additional testing if needed.

I suspect this may be related to an S4 wake source left enabled by the
firmware, but I have not identified the exact wake source yet.

Best regards,
Olzhas Marat

#regzbot introduced: a7c855969b1a
