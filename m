Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A717A30A
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775380542; cv=none; b=guOrQbI6TL80AlEVpLQxgBYefYg1/hUI9ckW3HIl8yi1ZWY+ZZaeKr1WOKEh2Mtw658m+CRN6DSislsPnHRFLR0SfbQdxPz91sL+Ma4SMNg6qnWDrianxRv3lvVNIPMZG80Eo/K6mIbHNqoHQEyVDHn4Y7za2qkRwsvY1OLGLSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775380542; c=relaxed/simple;
	bh=QsgUECxygV8T/LN69w1baPyglSdRdFa9YjKb3vC8QAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RX1uB+cjIPhMVEz/xz39oc2MMoeFIU5HeIe9RDNhyLxPEL7atDk5VZTY/HTerpB5TxWNdZMW9akE0JaZP4Gl1AmFoEJpW8nFV4IF/28QRTM++UaEaYyGRnTENqXVwOAswzjathStIi/DJiA5vdMkaaONycxrsEyUl+ouQIfneCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtzZkoEm; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtzZkoEm"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d95017a68so1645514a91.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775380540; x=1775985340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsgUECxygV8T/LN69w1baPyglSdRdFa9YjKb3vC8QAo=;
        b=UtzZkoEmYnLOep6m+Z7hgR0dNwzBhIEFfIieZedYhqaHcDkLb7/Q/UzdcnYewjU6CE
         wbT6jAm06d9quupXWZ3H+QaTlewJpO08MpsD1RHWuB9PZG63IB0ktHjj44HzuSY3Kv9y
         Sptbsau+M/0FqVVE6kxG2ltBcRQ3s1WkjXb9REUuFj80mSaIr4qzqzacY2VLpJgIb+A2
         3CRzKlJKM+8hPEmaVft+jvBLjKX9pq/ETNxEWTG137+8kk8JtQyGhT0kl98G4PhfbA54
         bOStoEb5oBoa6E++b+Tci5+xx3oUkmJRBirzebELJwcYP4Ims4BGAre2aD28D4FsOudR
         DiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775380540; x=1775985340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QsgUECxygV8T/LN69w1baPyglSdRdFa9YjKb3vC8QAo=;
        b=PcPioH+7HQE9F0PEx0JglQ19V1Rk3pWtZR6/BZG6/O+KdoP0kVYdxFqSU4404ymLds
         YtQ+BwAWwDCkd1a/LGPBQA0JiHTnkH5ClcWde4dvbmrH++E7MOIbKwM1izhHV21Ztm/B
         mxDYGj7oE9DQz3jHCk5neCJBRNOUEBR4EyOTFxoFngHxqpXXW74eEMmct/v93L2YehUO
         hv9SSHQtCwUtg9i9nEi13BTmv7Vkir1ajbFHZeHkm1L1K409XPVb2k+5LFtmUmNBNg3d
         QIjpM+LkO/OQRjCIbzKgcc3jhvt8wRZw/8fM34QJAeE+YoirdOVDOKmyHq4T/qjv332a
         /4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8sZeDcZ7XEmaicKYXjl6MwPXQzr1C9/B8hkGvHF56KROcYchyg9dPTxST0v2ZBMeJWnvJE2Pb4t4O@vger.kernel.org
X-Gm-Message-State: AOJu0YxuydI4bVmGLnNxS5j3sQey4LtRZSFye+9IV2pmTtTRyt2cC79b
	pHXIv2MwxfHbkD8gAaeOUTpVvepFe5kIMDrVzwdoijfgUtocrZiysr+vVan3qaPT
X-Gm-Gg: AeBDieuf3iapm0iJFfvzUTO2tXIYx2XapVaouL8hPo/tAEpA7JRAuXqOqFUFJfeFEhL
	yu5gqBKCGiCFh5Mx1A6ST0kZ57RSoU6z2kIH+5J/xrUqqbLo8zgiTEe1Dmb3crrhb+t+gM14z3P
	A5sDk3ru0WNlJCEITeYJ1ErtxGgd2fAhUURv3GAlPKf66ok0D5rteyJELw+Tmw94pVG7PUENd84
	KOYZ1436nfl+HRN8YaCfYHag4+SLGWZfWTx7PabkSkhH6L102Ni94LdWBuvv9WSJUG3TlbQAazX
	19SSyrlKMmJ/xz9pJjoReXdKBWbg2NrHT51W+sBV3n0cXZPxXDu9UEHhpNijojstfuqjFMyUd2D
	DM+Xr4nUP8uRhuMyFD91OEf+RKposWhp3l8bNsdT6J0cK0GssQF9p0gm/L2pFgncVWERNHnAaiN
	m4t3UgjL6G3db7tnJbQQR5L7w=
X-Received: by 2002:a17:90b:4c8b:b0:35d:a2d3:5c44 with SMTP id 98e67ed59e1d1-35de69d5567mr8170403a91.28.1775380540368;
        Sun, 05 Apr 2026 02:15:40 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:d639:9368:51aa:bf9c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de674a87dsm3208105a91.3.2026.04.05.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:15:39 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 14:45:17 +0530
Message-ID: <20260405091518.5322-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adIkXdCXr2x2zTrE@ashevche-desk.local>
References: 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Yes, multiple PA14250 variants are already on the market and shipping.
The Core Ultra 5 variants ship with Ubuntu 24.04 and are Ubuntu-certified.
The Dell Pro 13 Plus (PB13250) with Core Ultra 7 266V is also
Ubuntu-certified. My device, the PA14250 with Core Ultra 7 266V, ships
with Windows 11.

All of these Lunar Lake Dell laptops share the same ACPI BIOS issue with
INTC10B5 not having _CID set properly.

Regards,
Vasu Hansalia
