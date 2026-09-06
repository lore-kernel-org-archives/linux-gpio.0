Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A92741F5FB
	for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684386; cv=none; b=CAIaxochrCWf5kMuvOfRzyhjCL5x3KpmCvKacxckHLFZsptFA/plehc8VEAiVSuwcpiDHmDFikxDeMkpaw9SXY3lpDcr4dGAFRc76zIeJkSo0PKSy5b1zlM4XyfQXS91TYYCNZNWwLVQBT87PIXUUuAq0VALCaSe6P+QWyBnA2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684386; c=relaxed/simple;
	bh=nPnNq8PNL3EdxldTZ4UGGXWdBEEcU1yX193DQQnMoAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2kSchtlsmgqyHLXnVaCUH77umOBIbelXuQ2vNP4RLuW7VLT1YGhliuZdOrF/9v4DTNV1D86iz0kMjyBB1W3xvODRI+Eg5zx/kOkxggZOMSye9WWLZY2hT74U9EqBf00Ut6NVGT4n1Nu9VraAFaJRIuUPG5jopp9UMBJabLqzOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MucM33P6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MucM33P6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2188757a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2026 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684383; x=1789289183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZaFfOhlZYqUNpBBIQ32ijip3K7hsLhyzDi6pF6GBpc=;
        b=MucM33P6GbFRkFi1Tp0b5WZhb5XBl7ZvArKZeHO7Su02W335nbieNSuVUMQcfrSf21
         WFetc5mamiFh8SFO5NLnwkI/HIGvW6BcD/2P0l3TpfSv9CYrIuRAPkrFo0/93KYusscX
         cNj4CI9Lf+E9dxGkESfE9gpapn+25sJPdWkatxF/cBBIDjNRNRQChk6HOTk6nm6Bottz
         r9P20McBsW077crge/0D2qX2VXKZ2qRbIKTJAAU5fPgfy4Q3tg71+On5jWLAgKYVO38q
         6DeOqCY6cfDIIqCAhzeeKb0WBUscMQbOS3J0cPjlFYVPM4SZc8kKiU+1nPigeuFqAIcp
         C6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684383; x=1789289183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZaFfOhlZYqUNpBBIQ32ijip3K7hsLhyzDi6pF6GBpc=;
        b=KxfNcIpY1irpbq5+qA+o6ea3Wws7Ra4MqWbv03RcpUBq4CuuYIU13k9n6rhQxsMCoz
         vkd5496fCtSNU1rWOu7t/qxcS9AcQRjYys1K7hVRQaOfCX4iHluho5yfNv3iWGaIqoBZ
         7n/ON5BodP06MbESZ+fneBUNSGGb6nXbMEJ4A5NBKtwMbR8JuuAZ4xDTUkSYOHaYQlJO
         mHXOJ6CLxlN3NzEQpxvquEm9m6cxh94k/ldouJrMOkQQ4QXI6b7mZ5rfiq8ghy/AJjhw
         gwLv052x/VcfTlCr91kDSi5U9LGyUpYVOKVnW5J9MR9/Ba0iyNw2WaNYww0GUlyU/Krw
         HDlw==
X-Forwarded-Encrypted: i=1; AKwUvBzZeZOq/JAGwn/Pl5N5Xm3l76XyK8T3epxb86kBCCJyH+be8rWSv1kOeAdG5mmG+i9Ij2PI7NLHpXF0@vger.kernel.org
X-Gm-Message-State: AFuF++mzV1WFIwgy2N8nHx2DTVeS1AtfJg6LNHj0SgNmeBBAK6YX3lPW
	LUPIgfp1TnMJLK2UxRFbiD5D48nZc4U9FpD9ClPvUnYnyWDZg4KqYtGw
X-Gm-Gg: AYBFou0Kt+9SQN0lMXFUp7frpcStpdxHTTxxbodA51D+/lvzIZNK38VvQz2P0TCveof
	mpE7HygGZvlgxv1okpZsGAUJV+C/8xaQAKfJP7X4UP5YQn4afa8dGGz+eSULxAB4IZLHpZhMfKg
	+yDzBSoOHGOVuI5kZESIAI/tjK0bEZSyGk9DB+p9aQf3HU5baDwMZ6pXdmO8rWD4t6yfH+2zJQ4
	y4onREAVlTLZhjmJf457LNXdEBGUvIxNr7mzj9vDK4amwWcZjBZHtP29YSEzGwrV2HRqgUR9UcQ
	R9T3GZQJ02TOn+bBMICQWZ/PtjO52liWAqlpMtNfTl/JJnDftizjO7p+dzMHAcCBn3UgLtNa2rH
	gCWJeNVTb9vlh1CDSJBKZzQj730vqoeSqdEaXPpsu/cdAmYyGB0OHiJQPubI9DOIAAelGNidE7Q
	RCM9GSUdrp+z1UcQ7dCJ9LlgM+xLT1uWwaBX/ORYuAqlCzu+YKZQ06+iTXNDJy4o+7Csxq/H4Yr
	Masbjdw
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr23868891a91.0.1788684383083;
        Sun, 06 Sep 2026 01:46:23 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm20068158a91.8.2026.09.06.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:46:22 -0700 (PDT)
From: Kohei Ito <koheiito.dev@gmail.com>
Date: Sun, 06 Sep 2026 17:45:50 +0900
Subject: [PATCH 2/3] rust: gpio: Add basic consumer abstractions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
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

Add basic abstractions for GPIO consumer APIs.

Due to a bindgen issue that may generate the wrong type for enum types,
`gpio/consumer.h` is included at the top of `bindings_helper.h` as a
temporary workaround. Once the issue is resolved, it can be moved back
to its proper alphabetical position.

Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/gpio.rs             |   2 +
 rust/kernel/gpio/consumer.rs    | 437 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 440 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 98b048b36771..30985c102c70 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -26,6 +26,7 @@
  * This workaround may not be possible in some cases, depending on how the C
  * headers are set up.
  */
+#include <linux/gpio/consumer.h>
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
diff --git a/rust/kernel/gpio.rs b/rust/kernel/gpio.rs
index 819efc8a0c05..40b6c64e8f5e 100644
--- a/rust/kernel/gpio.rs
+++ b/rust/kernel/gpio.rs
@@ -11,6 +11,8 @@
     prelude::*, //
 };
 
+pub mod consumer;
+
 /// Describes GPIO direction.
 #[derive(Clone, Copy, PartialEq, Eq)]
 #[repr(u32)]
diff --git a/rust/kernel/gpio/consumer.rs b/rust/kernel/gpio/consumer.rs
new file mode 100644
index 000000000000..f81c7381c075
--- /dev/null
+++ b/rust/kernel/gpio/consumer.rs
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0
+// This file is based on rust/kernel/clk.rs.
+
+//! GPIO consumer abstractions.
+//!
+//! C header: [`include/linux/gpio/consumer.h`](srctree/include/linux/gpio/consumer.h)
+//!
+//! Reference: <https://docs.kernel.org/driver-api/gpio/consumer.html>
+
+use crate::{
+    device::Device,
+    error::{
+        from_err_ptr,
+        to_result,
+        Error,
+        Result, //
+    },
+    gpio::{
+        LineDirection,
+        LogicalLineLevel,
+        PhysicalLineLevel, //
+    },
+    prelude::*, //
+};
+
+use core::{ops::Deref, ptr};
+
+/// The GPIO descriptor flags to configure its direction and output value.
+///
+/// Rust abstraction for the C [`enum gpiod_flags`].
+///
+/// They can be combined with the operators `|`, and `&`.
+///
+/// Values can be used from the associated constants such as
+/// [`Flags::GPIOD_ASIS`].
+#[derive(Clone, Copy, PartialEq)]
+pub struct GpiodFlags(bindings::gpiod_flags);
+
+impl GpiodFlags {
+    /// Don't change anything.
+    pub const ASIS: Self = Self::new(bindings::gpiod_flags_GPIOD_ASIS);
+
+    /// Set lines to input mode.
+    pub const IN: Self = Self::new(bindings::gpiod_flags_GPIOD_IN);
+
+    /// Set lines to output and drive them low.
+    pub const OUT_LOW: Self = Self::new(bindings::gpiod_flags_GPIOD_OUT_LOW);
+
+    /// Set lines to output and drive them high.
+    pub const OUT_HIGH: Self = Self::new(bindings::gpiod_flags_GPIOD_OUT_HIGH);
+
+    /// Set lines to open-drain output and drive them low.
+    pub const OUT_LOW_OPEN_DRAIN: Self = Self::new(bindings::gpiod_flags_GPIOD_OUT_LOW_OPEN_DRAIN);
+
+    /// Set lines to open-drain output and drive them high.
+    pub const OUT_HIGH_OPEN_DRAIN: Self =
+        Self::new(bindings::gpiod_flags_GPIOD_OUT_HIGH_OPEN_DRAIN);
+
+    fn into_inner(self) -> bindings::gpiod_flags {
+        self.0
+    }
+
+    // Always inline to optimize out error path of `build_assert`.
+    #[inline(always)]
+    const fn new(value: bindings::gpiod_flags) -> Self {
+        build_assert!(value as u64 <= bindings::gpiod_flags::MAX as u64);
+        Self(value)
+    }
+}
+
+/// A reference-counted gpio descriptor.
+///
+/// Rust abstraction for the C [`struct gpio_desc`].
+///
+/// # Invariants
+///
+/// A [`GpioDesc`] instance holds either a pointer to a valid [`struct gpio_desc`] created by the C
+/// portion of the kernel or a `NULL` pointer.
+///
+/// Instances of this type are reference-counted. Calling [`GpioDesc::get`] ensures that the
+/// allocation remains valid for the lifetime of the [`GpioDesc`].
+///
+/// # Examples
+///
+/// The following example demonstrates how to obtain a GPIO line for a device.
+///
+/// ```
+/// use crate::{
+///     device::Device,
+///     error::Result,
+///     gpio::{
+///         consumer::{
+///             GpioDesc,
+///             GpiodFlags, //
+///         },
+///         LogicalLineLevel, //
+///     }, //
+/// };
+///
+/// fn examine_gpio(dev: &Device) -> Result {
+///     let gpiod = GpioDesc::get(dev, Some(c"reset"), GpiodFlags::ASIS)?;
+///
+///     gpiod.set_value(LogicalLineLevel::Inactive)?;
+///
+///     gpiod.set_value(LogicalLineLevel::Active)?;
+///
+///     Ok(())
+/// }
+/// ```
+///
+/// [`struct gpio_desc`]: https://docs.kernel.org/driver-api/gpio/consumer.html
+#[repr(transparent)]
+pub struct GpioDesc(*mut bindings::gpio_desc);
+
+// SAFETY: It is safe to call `gpiod_put` on another thread than where `gpiod_get` was called.
+unsafe impl Send for GpioDesc {}
+
+impl GpioDesc {
+    /// Gets [`GpioDesc`] corresponding to a [`Device`] and a connection id.
+    ///
+    /// Equivalent to the kernel's [`gpiod_get`] API.
+    ///
+    /// [`gpiod_get`]: https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get
+    pub fn get(dev: &Device, name: Option<&CStr>, flags: GpiodFlags) -> Result<Self> {
+        let con_id = name.map_or(ptr::null(), |n| n.as_char_ptr());
+
+        // SAFETY: It is safe to call [`gpiod_get`] for a valid device pointer.
+        //
+        // INVARIANT: The reference-count is decremented when [`GpioDesc`] goes out of scope.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::gpiod_get(dev.as_raw(), con_id, flags.into_inner())
+        })?))
+    }
+
+    /// Obtain the raw [`struct gpio_desc`] pointer.
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::gpio_desc {
+        self.0
+    }
+
+    /// Get the direction.
+    ///
+    /// Equivalent to the kernel's [`gpiod_get_direction`] API.
+    ///
+    /// [`gpiod_get_direction`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_direction
+    #[inline]
+    pub fn get_direction(&self) -> Result<LineDirection> {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_get_direction`].
+        let ret = unsafe { bindings::gpiod_get_direction(self.as_raw()) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            LineDirection::try_from(ret)
+        }
+    }
+
+    /// Set the GPIO direction to input.
+    ///
+    /// Equivalent to the kernel's [`gpiod_direction_input`] API.
+    ///
+    /// [`gpiod_direction_input`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_direction_input
+    #[inline]
+    pub fn direction_input(&self) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_direction_input`].
+        to_result(unsafe { bindings::gpiod_direction_input(self.as_raw()) })
+    }
+
+    /// Set the GPIO direction to output and assign the logical value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_direction_output`] API.
+    ///
+    /// [`gpiod_direction_output`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_direction_output
+    #[inline]
+    pub fn direction_output(&self, value: LogicalLineLevel) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_direction_output`].
+        to_result(unsafe { bindings::gpiod_direction_output(self.as_raw(), value.as_c_int()) })
+    }
+
+    /// Set the GPIO direction to output and assign the physical value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_direction_output_raw`] API.
+    ///
+    /// [`gpiod_direction_output_raw`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_direction_output_raw
+    #[inline]
+    pub fn direction_output_raw(&self, value: PhysicalLineLevel) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_direction_output_raw`].
+        to_result(unsafe { bindings::gpiod_direction_output_raw(self.as_raw(), value.as_c_int()) })
+    }
+
+    /// Get the logical GPIO value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_get_value`] API.
+    ///
+    /// [`gpiod_get_value`]: https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_value
+    #[inline]
+    pub fn get_value(&self) -> Result<LogicalLineLevel> {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_get_value`].
+        let ret = unsafe { bindings::gpiod_get_value(self.as_raw()) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            LogicalLineLevel::try_from(ret)
+        }
+    }
+
+    /// Assign the logical value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_set_value`] API.
+    ///
+    /// [`gpiod_set_value`]: https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_set_value
+    #[inline]
+    pub fn set_value(&self, value: LogicalLineLevel) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_set_value`].
+        to_result(unsafe { bindings::gpiod_set_value(self.as_raw(), value.as_c_int()) })
+    }
+
+    /// Get the physical GPIO value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_get_raw_value`] API.
+    ///
+    /// [`gpiod_get_raw_value`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_raw_value
+    #[inline]
+    pub fn get_raw_value(&self) -> Result<PhysicalLineLevel> {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_get_raw_value`].
+        let ret = unsafe { bindings::gpiod_get_raw_value(self.as_raw()) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            PhysicalLineLevel::try_from(ret)
+        }
+    }
+
+    /// Assign the physical value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_set_raw_value`] API.
+    ///
+    /// [`gpiod_set_raw_value`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_set_raw_value
+    #[inline]
+    pub fn set_raw_value(&self, value: PhysicalLineLevel) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_set_raw_value`].
+        to_result(unsafe { bindings::gpiod_set_raw_value(self.as_raw(), value.as_c_int()) })
+    }
+
+    /// Get the logical GPIO value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_get_value_cansleep`] API.
+    ///
+    /// [`gpiod_get_value_cansleep`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_value_cansleep
+    #[inline]
+    pub fn get_value_cansleep(&self) -> Result<LogicalLineLevel> {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_get_value_cansleep`].
+        let ret = unsafe { bindings::gpiod_get_value_cansleep(self.as_raw()) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            LogicalLineLevel::try_from(ret)
+        }
+    }
+
+    /// Assign the logical value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_set_value_cansleep`] API.
+    ///
+    /// [`gpiod_set_value_cansleep`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_set_value_cansleep
+    #[inline]
+    pub fn set_value_cansleep(&self, value: LogicalLineLevel) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_set_value_cansleep`].
+        to_result(unsafe { bindings::gpiod_set_value_cansleep(self.as_raw(), value.as_c_int()) })
+    }
+
+    /// Get the physical GPIO value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_get_raw_value_cansleep`] API.
+    ///
+    /// [`gpiod_get_raw_value_cansleep`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_raw_value_cansleep
+    #[inline]
+    pub fn get_raw_value_cansleep(&self) -> Result<PhysicalLineLevel> {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_get_raw_value_cansleep`].
+        let ret = unsafe { bindings::gpiod_get_raw_value_cansleep(self.as_raw()) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            PhysicalLineLevel::try_from(ret)
+        }
+    }
+
+    /// Assign the physical value.
+    ///
+    /// Equivalent to the kernel's [`gpiod_set_raw_value_cansleep`] API.
+    ///
+    /// [`gpiod_set_raw_value_cansleep`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_set_raw_value_cansleep
+    #[inline]
+    pub fn set_raw_value_cansleep(&self, value: PhysicalLineLevel) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_set_raw_value_cansleep`].
+        to_result(unsafe {
+            bindings::gpiod_set_raw_value_cansleep(self.as_raw(), value.as_c_int())
+        })
+    }
+
+    /// Test whether the GPIO is active-low or not.
+    ///
+    /// Equivalent to the kernel's [`gpiod_is_active_low`] API.
+    ///
+    /// [`gpiod_is_active_low`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_is_active_low
+    #[inline]
+    pub fn is_active_low(&self) -> Result<bool> {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_is_active_low`].
+        match unsafe { bindings::gpiod_is_active_low(self.as_raw()) } {
+            0 => Ok(false),
+            1 => Ok(true),
+            err => Err(Error::from_errno(err)),
+        }
+    }
+
+    /// Report whether gpio value access may sleep or not.
+    ///
+    /// Equivalent to the kernel's [`gpiod_cansleep`] API.
+    ///
+    /// [`gpiod_cansleep`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_cansleep
+    #[inline]
+    pub fn cansleep(&self) -> Result<bool> {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`gpiod_cansleep`].
+        match unsafe { bindings::gpiod_cansleep(self.as_raw()) } {
+            0 => Ok(false),
+            1 => Ok(true),
+            err => Err(Error::from_errno(err)),
+        }
+    }
+}
+
+impl Drop for GpioDesc {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`gpiod_put`].
+        unsafe { bindings::gpiod_put(self.as_raw()) };
+    }
+}
+
+/// A reference-counted optional gpio descriptor.
+///
+/// A lightweight wrapper around an optional [`GpioDesc`]. An [`OptionalGpioDesc`] represents
+/// a [`GpioDesc`] that a driver can function without but may improve performance or enable
+/// additional features when available.
+///
+/// # Invariants
+///
+/// An [`OptionalGpioDesc`] instance encapsulates a [`GpioDesc`] with either a valid
+/// [`struct gpio_desc`] or `NULL` pointer.
+///
+/// Instances of this type are reference-counted. Calling [`OptionalGpioDesc::get`] ensures that
+/// the allocation remains valid for the lifetime of the [`OptionalGpioDesc`].
+///
+/// # Examples
+///
+/// The following example demonstrates how to obtain and configure an optional GPIO for a
+/// device. The code functions correctly whether or not the GPIO is available.
+///
+/// ```
+/// use crate::{
+///     device::Device,
+///     error::Result,
+///     gpio::{
+///         consumer::{
+///             OptionalGpioDesc,
+///             GpiodFlags, //
+///         },
+///         LogicalLineLevel, //
+///     }, //
+/// };
+///
+/// fn examine_gpio(dev: &Device) -> Result {
+///     let gpiod = OptionalGpioDesc::get(dev, Some(c"reset"), GpiodFlags::ASIS)?;
+///
+///     gpiod.set_value(LogicalLineLevel::Inactive)?;
+///
+///     gpiod.set_value(LogicalLineLevel::Active)?;
+///
+///     Ok(())
+/// }
+/// ```
+///
+/// [`struct gpio_desc`]: https://docs.kernel.org/driver-api/gpio/consumer.html
+pub struct OptionalGpioDesc(GpioDesc);
+
+impl OptionalGpioDesc {
+    /// Gets [`OptionalGpioDesc`] corresponding to a [`Device`] and a connection id.
+    ///
+    /// Equivalent to the kernel's [`gpiod_get_optional`] API.
+    ///
+    /// [`gpiod_get_optional`]:
+    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_optional
+    pub fn get(dev: &Device, name: Option<&CStr>, flags: GpiodFlags) -> Result<Self> {
+        let con_id = name.map_or(ptr::null(), |n| n.as_char_ptr());
+
+        // SAFETY: It is safe to call [`gpiod_get_optional`] for a valid device pointer.
+        //
+        // INVARIANT: The reference-count is decremented when [`OptionalGpioDesc`] goes out of
+        // scope.
+        Ok(Self(GpioDesc(from_err_ptr(unsafe {
+            bindings::gpiod_get_optional(dev.as_raw(), con_id, flags.into_inner())
+        })?)))
+    }
+}
+
+// Make [`OptionalGpioDesc`] behave like [`GpioDesc`].
+impl Deref for OptionalGpioDesc {
+    type Target = GpioDesc;
+
+    fn deref(&self) -> &GpioDesc {
+        &self.0
+    }
+}

-- 
2.50.1

