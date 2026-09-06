Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B823F44E9
	for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684387; cv=none; b=snaQbK/W6WBdtjiePjv+wKnC+evIe4+URiqsQzShE4Vqr7zqr3WU1n+TuDEAMzX/tiBmn9tA2LUdJMKSxW0+A4EtJksohIBWqPCZN4YRdbaCyU0jTheIWYzOEgCbSz7WpRpVrAtaW7dO9NX60VBPYFNVITU6zP/ABg3XTSu7V+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684387; c=relaxed/simple;
	bh=EAwiGhsNfNUoTWCfH5MKHO2VRQhaq1dnt2ypoyVNiWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3bFEBdf32Xa0jkwVKyap4IgrZQUABnkhw1Y4cqx02uDOtbnv36yfl0YxYvSk+ylCiRPf0geamnAIDwddLuHL2eN6ORf/CCf9D0RQl0lBSpLJJ5YRCDXereI8qTU3MhdScamA8mDlg7Ai4Z9yMoFGjmZqgzkMJ7V1AyliRO8nVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXriYoCS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXriYoCS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2037802a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2026 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684385; x=1789289185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5IIaAx3QztQSmArELd1kmaa4AxdD+imzocVdEF8EdM=;
        b=HXriYoCSKM21a5H9MmP+Id9gCuGSBw2ZptUfmvCIPaYNnovQurrm6udYtDT/jotBk2
         fKUCZXmJHiomt1mBsyJ4P/E6CIvG8JLn3K+rov0P2/GbySOZLipzqJrn1o747xKdNLTG
         fa/qN5ttDexkHTbZ68D1MYMYc/a0PNUnJvN5CW/k1eGDLQ2NHDGcbZ1n/K5ce1jU1JIl
         axYIxexXxqvJTR+dxsJrOmXBEXRrNNv+VlQ9HWTdUShpzdCz8YAUTKp3ESl8QCG98EbR
         hF3JgmG6kIUsWy1fpWMX5Mu//TUcUrcv9/+JDfhUKrOt/hAQx4iv41K6guer2Lug+nWZ
         SiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684385; x=1789289185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5IIaAx3QztQSmArELd1kmaa4AxdD+imzocVdEF8EdM=;
        b=FhYzAPgqSL9pWvWwY6fUKM6ugclwFcVV1ZH3kWCn5Su33T68Kxz82i51Vt7soRzRMy
         NaU/74/TnFzcY9VsXFgEZKeWXUUrEqGKh/P1ECc8E+R0C+8XRLFWG3VQ3YDV9WjiDaat
         k2d14yty8P/QLZvrsqaMiQBVEj19pg9RU/PC2LZl4CqnfjCpFROvTdnkDKsQPFpdz8B1
         ifJ7vHekCThx7HRkjWOYM18Mq9ik8dVQf00/BoEe+DVyDih/qR0DId2u2cRQ7dJrVOL+
         75qKdXbXwNmOzVMyPvofWk46TIV207aVajF3raduA8FSNOm71PscnNgJAOsYrmLOa+1Q
         eGyA==
X-Forwarded-Encrypted: i=1; AKwUvByytxkZMkv9pFJ8OPlSWjLHThyYUsNR609sD1yKWEY71mX9mCE4ee8ELRCXdmwsBoXR5BsFKlGUGKO6@vger.kernel.org
X-Gm-Message-State: AFuF++kVFk8QK1rizE/d8W6fa9IVOT4I3VnjvyigkSHOP9n6bJWzs7+u
	LRbuBJXhxFz52bP8j0HwkIrMY63SQO3mVxsCblk9tOlhE+XCx3IvTad0
X-Gm-Gg: AYBFou1GSek19zMslRcCwW6arEVEDEY+3UPENaWLoQk+f2BD1AiT6yDEpOrszxOOdz5
	p+quq1f09MXE1SBeWVa6N9uQKo/9HKNOl5MOffznP1mnIOtBHOSbB1V+GcdPddwgWRiAkkxsHxd
	nyLTve8DMj3a263OnNWNTGRGS13x95/iyFKZoJnSJMI9QCiEEM+Wqkrbj9pSeCRfHdukT/ogHO2
	cI2VqPsZxt5RGQHwxnKJXGL31QUmv+xNH4ky6u1Pd+l93Fq5MANT5z2ea04lH57Ej/iAuipWXp6
	pAtTxsXQKjtIkYb3rDR4AK4z7RNFaHtA5bmAdCaed91NNbhlYcpEFQIfO/9oN2L8wlgt+4ApYtt
	6OjA8oMTHmZj4qmfFqvRCLvpfeszHurvmbR97H3EiRKus7kOqye0IfD9JaK/G1cxehnbagyl6am
	3P1pDwz1/jc5fpR/OH5aEBxbwb32mlNa1GqK2qsmPHC8pIziYpqEBMP0WaHc3hH44nSyljsmgc3
	HGTpGzk
X-Received: by 2002:a05:6a21:8202:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3da3a11eee0mr23307025637.18.1788684385308;
        Sun, 06 Sep 2026 01:46:25 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc46da5acabsm1204179a12.8.2026.09.06.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:46:24 -0700 (PDT)
From: Kohei Ito <koheiito.dev@gmail.com>
Date: Sun, 06 Sep 2026 17:45:51 +0900
Subject: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
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

Add a sample driver to demonstrate the use of the Rust GPIO APIs.

Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
---
 samples/rust/Kconfig               |  11 +++
 samples/rust/Makefile              |   1 +
 samples/rust/rust_gpio_consumer.rs | 156 +++++++++++++++++++++++++++++++++++++
 3 files changed, 168 insertions(+)

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab9106345..1085d90c87f3 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -161,6 +161,17 @@ config SAMPLE_RUST_DRIVER_AUXILIARY
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_GPIO_CONSUMER
+	tristate "GPIO Consumer Driver"
+	depends on GPIOLIB
+	help
+	  This option builds the Rust GPIO consumer sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_gpio_consumer.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_SOC
 	tristate "SoC Driver"
 	select SOC_BUS
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58cccc..1cf181dea6d3 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
+obj-$(CONFIG_SAMPLE_RUST_GPIO_CONSUMER)		+= rust_gpio_consumer.o
 obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
diff --git a/samples/rust/rust_gpio_consumer.rs b/samples/rust/rust_gpio_consumer.rs
new file mode 100644
index 000000000000..b70b305126fc
--- /dev/null
+++ b/samples/rust/rust_gpio_consumer.rs
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust GPIO consumer driver sample.
+
+use kernel::{
+    device::{
+        self,
+        Core, //
+    },
+    gpio::{
+        self,
+        consumer::{
+            GpioDesc,
+            GpiodFlags, //
+        }, //
+    },
+    of,
+    platform,
+    prelude::*,
+    time::{
+        delay::fsleep,
+        Delta, //
+    }, //
+};
+
+struct SampleDriver;
+
+impl platform::Driver for SampleDriver {
+    type IdInfo = ();
+    type Data<'bound> = Self;
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe<'bound>(
+        pdev: &'bound platform::Device<Core<'_>>,
+        _info: Option<&'bound Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> + 'bound {
+        let dev = pdev.as_ref();
+
+        dev_dbg!(dev, "Probe Rust GPIO consumer driver sample.\n");
+
+        Self::examine_gpio(dev)?;
+
+        Ok(Self)
+    }
+}
+
+type GetValue = fn(&GpioDesc) -> Result<gpio::LogicalLineLevel>;
+type GetRawValue = fn(&GpioDesc) -> Result<gpio::PhysicalLineLevel>;
+type SetValue = fn(&GpioDesc, gpio::LogicalLineLevel) -> Result<()>;
+type SetRawValue = fn(&GpioDesc, gpio::PhysicalLineLevel) -> Result<()>;
+
+impl SampleDriver {
+    fn examine_gpio(dev: &device::Device) -> Result {
+        let gpiod = GpioDesc::get(dev, None, GpiodFlags::ASIS)?;
+
+        let cansleep = gpiod.cansleep()?;
+        let (get_value, get_raw_value, set_value, set_raw_value): (
+            GetValue,
+            GetRawValue,
+            SetValue,
+            SetRawValue,
+        ) = if cansleep {
+            (
+                |gpiod| gpiod.get_value_cansleep(),
+                |gpiod| gpiod.get_raw_value_cansleep(),
+                |gpiod, value| gpiod.set_value_cansleep(value),
+                |gpiod, value| gpiod.set_raw_value_cansleep(value),
+            )
+        } else {
+            (
+                |gpiod| gpiod.get_value(),
+                |gpiod| gpiod.get_raw_value(),
+                |gpiod, value| gpiod.set_value(value),
+                |gpiod, value| gpiod.set_raw_value(value),
+            )
+        };
+
+        let pr_status = || -> Result<()> {
+            dev_info!(
+                dev,
+                "direction: {}, value: {}, raw value: {}\n",
+                gpiod.get_direction()?,
+                get_value(&gpiod)?,
+                get_raw_value(&gpiod)?
+            );
+            Ok(())
+        };
+
+        let active_low = gpiod.is_active_low()?;
+
+        dev_info!(
+            dev,
+            "got the GPIO ({}{})\n",
+            if active_low {
+                "active low"
+            } else {
+                "active high"
+            },
+            if cansleep { ", sleepy" } else { "" }
+        );
+        pr_status()?;
+
+        gpiod.direction_output(gpio::LogicalLineLevel::Inactive)?;
+        dev_info!(dev, "line is inactivated\n");
+        pr_status()?;
+
+        fsleep(Delta::from_millis(1));
+
+        set_value(&gpiod, gpio::LogicalLineLevel::Active)?;
+        dev_info!(dev, "line is activated\n");
+        pr_status()?;
+
+        fsleep(Delta::from_millis(1));
+
+        set_value(&gpiod, gpio::LogicalLineLevel::Inactive)?;
+        dev_info!(dev, "GPIO: line is inactivated\n");
+        pr_status()?;
+
+        fsleep(Delta::from_millis(1));
+
+        let level = get_raw_value(&gpiod)?;
+
+        gpiod.direction_input()?;
+        dev_info!(dev, "line is input mode\n");
+        pr_status()?;
+
+        fsleep(Delta::from_millis(1));
+
+        gpiod.direction_output_raw(!level)?;
+        dev_info!(dev, "line is toggled\n");
+        pr_status()?;
+
+        fsleep(Delta::from_millis(1));
+
+        set_raw_value(&gpiod, !!level)?;
+        dev_info!(dev, "line is toggled\n");
+        pr_status()?;
+
+        Ok(())
+    }
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SampleDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c"test,rust-gpio-consumer"), ())]
+);
+
+kernel::module_platform_driver! {
+    type: SampleDriver,
+    name: "rust_gpio_consumer",
+    authors: ["Kohei Ito"],
+    description: "Rust GPIO consumer driver",
+    license: "GPL v2",
+}

-- 
2.50.1

