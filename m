Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974863537CD
	for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684383; cv=none; b=OlooJiKjrWwFUD1BOg3jqitRs31U7O5lTbunalLPfFZDYCdPzu7mmw77hbiiNbSEbrZ7c9kwQoAESSATox49lj77aOZAoh6ItRgcwFoX650nagG36yiWXKTMZJLLxgpgp6XxJ4pfeh/9Jh1IgFxChgnCku/8RCEgvLJ8j0lj+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684383; c=relaxed/simple;
	bh=UFA5fI8C+4EiuKIzvPGp1iegNLyohGUY8/0+ZYqGEXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgtiPbRkKZ+/JNrOBFfAXtdoklNM95Q4U1J8RnUeFdvT1ZVbC4I0hLEmePJ1rSFWL2JlH+BRR2qcva7upm1pXvdEgcXEa67e5mjwCBEDGvh71QKhJ29bQgElZex8w3+C1f8U/a4nnYiVnFodyLBAFSfbouCv8fpaGF5UzwUNNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0j/fD/L; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0j/fD/L"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so3079857b3a.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2026 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684381; x=1789289181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gkzIc2mrM4Qdq/WyMfgp/R6p5u/2x3xKFYvN0yjh84=;
        b=j0j/fD/LrMDYgCiVOcsLBVWp7yp4OKf/wP9yCmjM3LwC1xlKJxSyos6fMKVNGC09DV
         v7DniNZbWTKezAljB9rkcENQwJcw0jDXDDAkOlIbVYjw87LzDMuxJOdo0tr1XpbscNjJ
         AB27Ya6EqEv3bYT0ROSD/ZChbHh7/w1aoHi+WMYVITzk+u84gMMmmB8EW5S/hHIv7rwh
         o8uiHmTjMvAuMnAPtPvodmE4VSTvGjQAV8/hCVStt3ZrO0s39Ls/GWbGQIwUcI+5nzp6
         2Qfc60dn5PHCPujww5uF9QFUT5a+noyshVBpMKHqgHE82JNKPxQmWeGwg76ysuwe9Ccv
         nBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684381; x=1789289181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gkzIc2mrM4Qdq/WyMfgp/R6p5u/2x3xKFYvN0yjh84=;
        b=W62RH+z2U9Oz0mTQTklXYpb+8MSVrY8VXjDXLR2/LUHHTs/Iq07DvFMMb16FXBTsTR
         H1WYD995jxOf/UXblit7d63vmUk0m4z4F5lgUJdDUgfmE9Uq13b6Ggck2/YGbz3Vytra
         nhcyzOrWXieVuNndHHFE2x9YiglT0h5nacGdcIbsm7BhDtAJTL/cxIcN0jnJQ6gU2Mhg
         7wM2+9fV+iHebObuM3FQRP19ZymTYVxog9ynLKO1RPOlgyGUXc9hLthahgLBfh8SmQPs
         jW3Ip23QuqFYAeyPu+gqx0hW0OgNzKcxYFxrmgwBTQi8vs3alyo18NUofSNGfgvUXC2z
         vIdw==
X-Forwarded-Encrypted: i=1; AKwUvBxyzkc/NZ3R3sazWZqaY/bpl/iYmFIadAQHfAvMT/gWi+wZaBCB3YV8mvPEy08cLE7GoPsNZEYMto5w@vger.kernel.org
X-Gm-Message-State: AFuF++kUwM/LaqOjJ68i/lEYhogNQfcr3INqb0C8Z3MU7D6LzdT9ooHF
	VpdRD6jMXnbQF31YrnbiyPujHLIQlVfBZGjs4U5m+lEPS0AyeRKG3Rw6
X-Gm-Gg: AYBFou3GnHY8awz0Y0NW7F9OYQEklxaPj2GdmMKq8KDV9D/iDlTaCWqG69y89MwSoEo
	jmMMMqTk3dg+p/JmFZfHH0WwXAKSj699tMDBDhUDmTzR7SkgMEn1JZ+lemaAbH5JBfgjiYtvYpI
	OtUJsxxj2a6AnhJlhMkLEPg4KJhwuNQw4iImhCXX3KweSsaXiH77aKhqhRkoTRdGtTTUlq8xIQe
	RFsaymjXfhHdyhIh7FzTuZMPmawEe1yEa8WpmMNncqURfVdmP+LroxuDU9ljc1ppVE8WCyFZrx4
	wCXv3UWcqyRguDaVlsY26+VTigi9Sx1P5O3Gq3SzsOKUr0Du5uk4UmvertuIME3NHeeQTi9Fx9P
	+Jx52RLjLAagaF9SGdOWach6Y8dn6LDt+LY/we1TSl5+rl1jJgHLdncTql7ut2V1SQ64NIRIvLL
	GwmYhvTqwsO5N5sfk6ew2dZBK0Sg6ufSSERPLMVdYjrXy9LqH5jXrYXoMhLIv929UcptSLOZHMA
	sTYm9ry
X-Received: by 2002:aa7:88c3:0:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-861696788b3mr22513081b3a.3.1788684380945;
        Sun, 06 Sep 2026 01:46:20 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554770f6sm2697918a12.24.2026.09.06.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:46:20 -0700 (PDT)
From: Kohei Ito <koheiito.dev@gmail.com>
Date: Sun, 06 Sep 2026 17:45:49 +0900
Subject: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
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

Add the top-level GPIO module with minimal common definitions. This
module is the basis for future Rust GPIO extensions.

Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/gpio.rs             | 152 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 155 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b..98b048b36771 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -61,6 +61,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/gpio/defs.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
diff --git a/rust/kernel/gpio.rs b/rust/kernel/gpio.rs
new file mode 100644
index 000000000000..819efc8a0c05
--- /dev/null
+++ b/rust/kernel/gpio.rs
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPIO abstractions.
+
+use crate::{
+    error::{
+        Error,
+        Result, //
+    },
+    fmt,
+    prelude::*, //
+};
+
+/// Describes GPIO direction.
+#[derive(Clone, Copy, PartialEq, Eq)]
+#[repr(u32)]
+pub enum LineDirection {
+    /// Represent the output direction.
+    Out = bindings::GPIO_LINE_DIRECTION_OUT,
+
+    /// Represent the input direction.
+    In = bindings::GPIO_LINE_DIRECTION_IN,
+}
+
+impl core::ops::Not for LineDirection {
+    type Output = Self;
+    fn not(self) -> Self::Output {
+        match self {
+            Self::Out => Self::In,
+            Self::In => Self::Out,
+        }
+    }
+}
+
+impl TryFrom<c_int> for LineDirection {
+    type Error = Error;
+    fn try_from(value: c_int) -> Result<Self> {
+        match value {
+            v if v == Self::Out as c_int => Ok(Self::Out),
+            v if v == Self::In as c_int => Ok(Self::In),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl fmt::Display for LineDirection {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            Self::In => f.pad("In"),
+            Self::Out => f.pad("Out"),
+        }
+    }
+}
+
+/// Describes the logical GPIO level, i.e. taking the ACTIVE_LOW status into account.
+#[derive(Clone, Copy, PartialEq, Eq)]
+pub enum LogicalLineLevel {
+    /// Represent the logical inactive level.
+    Inactive,
+
+    /// Represent the logical active level.
+    Active,
+}
+
+impl core::ops::Not for LogicalLineLevel {
+    type Output = Self;
+    fn not(self) -> Self::Output {
+        match self {
+            Self::Inactive => Self::Active,
+            Self::Active => Self::Inactive,
+        }
+    }
+}
+
+impl LogicalLineLevel {
+    fn as_c_int(&self) -> c_int {
+        match self {
+            Self::Inactive => 0,
+            Self::Active => 1,
+        }
+    }
+}
+
+impl TryFrom<c_int> for LogicalLineLevel {
+    type Error = Error;
+    fn try_from(value: c_int) -> Result<Self> {
+        match value {
+            0 => Ok(Self::Inactive),
+            1 => Ok(Self::Active),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl fmt::Display for LogicalLineLevel {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            Self::Inactive => f.pad("Inactive"),
+            Self::Active => f.pad("Active"),
+        }
+    }
+}
+
+/// Describes the raw GPIO level, i.e. the value of its physical line without regard for its
+/// ACTIVE_LOW status.
+#[derive(Clone, Copy, PartialEq, Eq)]
+pub enum PhysicalLineLevel {
+    /// Represent the physical LOW level.
+    Low,
+
+    /// Represent the physical HIGH level.
+    High,
+}
+
+impl core::ops::Not for PhysicalLineLevel {
+    type Output = Self;
+    fn not(self) -> Self::Output {
+        match self {
+            Self::Low => Self::High,
+            Self::High => Self::Low,
+        }
+    }
+}
+
+impl PhysicalLineLevel {
+    fn as_c_int(&self) -> c_int {
+        match self {
+            Self::Low => 0,
+            Self::High => 1,
+        }
+    }
+}
+
+impl TryFrom<c_int> for PhysicalLineLevel {
+    type Error = Error;
+    fn try_from(value: c_int) -> Result<Self> {
+        match value {
+            0 => Ok(Self::Low),
+            1 => Ok(Self::High),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl fmt::Display for PhysicalLineLevel {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            Self::Low => f.pad("Low"),
+            Self::High => f.pad("High"),
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..6c96c1269249 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -73,6 +73,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_GPIOLIB)]
+pub mod gpio;
 #[cfg(CONFIG_GPU_BUDDY = "y")]
 pub mod gpu;
 #[cfg(CONFIG_I2C = "y")]

-- 
2.50.1

