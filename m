Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795F52F7F00
	for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684380; cv=none; b=Y48gDKBy24jyxAlNW3kS/9lnHil3KlKkZ2J3OWVBAsMMVpwLIhtkA8yisR8bdiS3IGdpJed9DzvALgwBsRIW69anbfleQieObQFMoO/eE5cs6w7TkZYpuIuwdVnRBW3BQejsfHbscmudZNSpyUlU/F283qUIq1idKx3hNzAahBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684380; c=relaxed/simple;
	bh=IdlUNGokVn7UUx2Hf4dkFaFQZxZHWUcsZhhOiubKWGQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=synx6lUUjOQk3CPpdHBSQbAl1g41w5joJh2KrghioLw1IL6lrqBTpHWFbl0nkOznFpHCp2r1d1MrHh3Df35ZNJhoygicq+0DLswIDGZd8eStITrx4wLueedccuesfJKx9lalawAGyjLCoMsNmCXBbqYu4N1a7BPQFeKARornv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdV1mNen; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdV1mNen"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1942337a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684379; x=1789289179; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9nIbS0NJ71vyvrSJ2KtRLrKXbssxt03ighnJw6FO84w=;
        b=TdV1mNenUSdYXO4tAb07Crmnl0luqdSwP8ICEDVxCPjvq8hzK+TXs3NjCGo5v3dqAA
         yRy7JRNnA2birEcHtkUSGWThS7Z6CniGos2zfFNMbo0r51q57Vpzab+HPNqlbLiMaGqU
         /R3BFuDlqTSIl/LkiN+mAUi9M4XTe93SVsaueAzuSk0OQz5/D1v9/yg6JY8pxbv2atdi
         8PQL637w1/55LGHGilThpQ8NmsaLtF3KA8sMCkcQ+IFC5GFSw/+l1giwPA1K3AMFoKJW
         e4AH8owQ4skapFPn2pU7vpJKWV59Xsp4Pdgu4Rj8lyYAvni3wUeCelJMS4lPKSPZSrOh
         RZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684379; x=1789289179;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9nIbS0NJ71vyvrSJ2KtRLrKXbssxt03ighnJw6FO84w=;
        b=UfinoiDEYjqiwehPQcHSqlmMpTc6BxQOFBBb3ySFjnCZhRaLVv7ILPZAQg9BeFAsmV
         K3ag2cYYgfe+qBnE5d4yvyVafYPPcGyIdrKcShpC9NcyT680woySvUAtHg+l20ZIb9he
         SYBj10nH9M65pbBLw9CostdDH9x+4xe98cRc47tv3tpn2mfZptd86UlwhJiIv7b830HN
         qJoTz6XkXc7tZz0xUJjYmznDG00u9InHGCY9t+MgYNHDKdzNGwzdrRl4joOzoABLT91l
         /JVgNai3axk/2KjOI54h1QcdbRZf7xQYcUsRabxaDjDOnhUVMm0fEug1/j01TV+w0zRq
         FlEw==
X-Forwarded-Encrypted: i=1; AKwUvBwYYbC3BNxkKIDs84MmJZIes2OAzEJ9zWxdHjn7hr4kzsXIbSpTLXQW6RN9Ybz/6CKwzWF/FMBtRmoi@vger.kernel.org
X-Gm-Message-State: AFuF++k5HlhBNh05o4jOKhKvSa3Zr+HkhmbUjwvw//kSAMYWBF2Is5iF
	N01hC5VqqL1GNhY8AA3dsm1m+aV0dK6ARoO1l12yHsYBxKE5dwI+EjkR
X-Gm-Gg: AYBFou1eqpkw94o/RBPrhd4dndbUY+th2A38Vx4Ege2FrzsvvgKPIJoS/xpcpw70AKF
	8H1hMWaJV3hOF/Nbtnu1WCU+2rMfQoj0xOOZSRyw/g0dPa/3x5p5dhHZPx8ZfXJWbvA7taMhs4e
	f0xOLOvDD9ccPNcuU9fHEMSAebCqYwbKAPQU7zXzKkoPrMPB9Jp5rx+qgBXIgJbxJHI/vbSw4E+
	G0v2T+M7iK6aDwawrqc3qQw3Xv3fSE/rUlzcwD0Ty35EX4yf7wlpHF2ifQvhq/CD1IpNwGDAC5v
	Iqbkql/87BbQmrZNTveZ8jCtB4wb7FHeoY5qrBNsah7BqZcFuoZDBGdKXVh1AX+8hGHeAnRI3Mu
	cEt3uPrvVcIXZh/Qwa4FZ+sfVqQ90uq4Udf7JrEndurB1sES+eRfYq5asHugai7+QKJ0xkhX0EP
	BjtBTxHC7KpRJ7+gjHRp6a/un0QBuV7OeDPwM23pD4X9gr5N8aFspmrERxw2GbhjhC52WcIFQqV
	f7yc4+E
X-Received: by 2002:a17:90b:2c87:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39b26191cf2mr25113978a91.9.1788684378775;
        Sun, 06 Sep 2026 01:46:18 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm20589811a91.9.2026.09.06.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:46:18 -0700 (PDT)
From: Kohei Ito <koheiito.dev@gmail.com>
Subject: [PATCH 0/3] rust: Add basic GPIO consumer abstractions
Date: Sun, 06 Sep 2026 17:45:48 +0900
Message-Id: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0onWoC/yXMQQqDMBBA0avIrDuQCrXGq5QuTDKxU2giM0YE8
 e6N7fIt/t9BSZgUhmYHoZWVc6q4XhrwrzFNhByqoTVtZ6y54RgCStEFp5kz+py0fEiwv1sb+84
 5FwPUeBaKvP3Gj+ffWtyb/HLe4Di+sg+QnnoAAAA=
X-Change-ID: 20260905-add-rust-gpio-consumer-8799f86bbbfd
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Kohei Ito <koheiito.dev@gmail.com>
X-Mailer: b4 0.15.2

This series introduces basic GPIO consumer abstractions for Rust.

- Patch 1 adds the top-level GPIO module with minimal common
  definitions.
- Patch 2 adds the initial GPIO consumer (gpio_desc) abstraction.
- Patch 3 adds a sample driver to demonstrate the use of the Rust GPIO
  APIs.

Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
---
Kohei Ito (3):
      rust: gpio: add GPIO module with common definitions
      rust: gpio: Add basic consumer abstractions
      sample: rust: Add GPIO consumer sample driver

 rust/bindings/bindings_helper.h    |   2 +
 rust/kernel/gpio.rs                | 154 +++++++++++++
 rust/kernel/gpio/consumer.rs       | 437 +++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                 |   2 +
 samples/rust/Kconfig               |  11 +
 samples/rust/Makefile              |   1 +
 samples/rust/rust_gpio_consumer.rs | 156 +++++++++++++
 7 files changed, 763 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260905-add-rust-gpio-consumer-8799f86bbbfd

Best regards,
--  
Kohei Ito <koheiito.dev@gmail.com>

