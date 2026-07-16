Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9810E3A7195
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201618; cv=none; b=AePcLAV9GutXp1XVjvnKAWGXVYgwVlY+mVXylf0/mbH2moVof5TVW6sDOQAsncBiEQh92fFh1FP6w0xJp0k6B6CQZ2RXCjyxFQiYIkt0abXxYESBbWqC4/dd8zLS/RRQDVUj50FNMhBOBcGDkBtc7QYbMML9XIohDyGqOlGiq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201618; c=relaxed/simple;
	bh=6uswkF5WbsXVk4hr2MyfNOWqfKaucjzJwj6p3hm0Nek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liNXcWIId9ftbH+ZlF91DMNCwYdWObQOnknSSHlp9/He4HerR4wiP1EL/c32yNLojZYQXheElUcyd1f3mPOcNQlMdEOQzqwDr3nPsTJ24sLJmfbMDxNq+B2oGXpHaRZlwDIt3MEMYPsxBjW5VLTWUp0+rIsnC45i9K+/79yf/sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QobsKk5z; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QobsKk5z"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso5217251a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201616; x=1784806416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kc3QrXvErcy5sI0D6g29JLJWpplSNyHTpwcodl4uP1w=;
        b=QobsKk5zOtBGMplmSg+3vWlhvT8eWs3fp29PUe3hPvP9G0557PZdO3BZxc6U4LtyDv
         VfHsweAFOL4+ZTzqEJDzVfNOFmfmwoOxWAv/QZIODy5Q1cjO+bJbaSlj2A6fmwHJTj/C
         fK4u1w+DMTIbDHjx045hgjVbwyJ4y0JlDYkwslXYTgKdESBD0TXkQN/o7R+gB24j0SuU
         Yud0ted2soPz6fxPVX/Uy+OTWDeUWBlJlCZt9cjpUpfR6QDt6lcsJ+d+BBvhNBNNlt+w
         mxLdQrqvBLRCdwumCgfaLCfB2Epd1Y/e0Tb3i5SPA+ZR13FMEnAPv5Xy2IXpwDOuEnKo
         4viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201616; x=1784806416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kc3QrXvErcy5sI0D6g29JLJWpplSNyHTpwcodl4uP1w=;
        b=GVx3f5mEXvv6doc+XkvwoneRRn9gkKWqDD90rt5pWjBZdinB1Oj87bVv5E0MnQQfVM
         ChaRYkIh6gjVQ0CYUddMBSM/jGkej6KkT7xJdEhEmaIbyqtCxZI3x6JRdLJPE2CeAUF8
         qeSJPWC+WeWyS267WQxM1NwbfiyVHYYON0Yton1IaaqHoJ77OGbZvxi7MpcRdEbR3HmY
         0uOq84UtCAf+EX+KN3fp7uGlKgXnECloRQZkJuQM408Zv15G5pec3z4W6HiKFjqJu4C3
         3jT/VRlB1ef+X8aotYCybuAblTGQbSS1vhf/x78PeQAiJFgRhiysvLVBRWKzyAN6Who2
         nYfA==
X-Gm-Message-State: AOJu0Yz5EEppBu4BAAFDMOdPPtEjCy9x+FAX9AgMJRvMgM4GwJHG9gmm
	o9xcBd8bolfJxjbCgFYNcqmIPOTBbnebD3pSNLz3V6Z5eHNxhep5BJ4E
X-Gm-Gg: AfdE7ckxgXobqvOLqHThHNcbtlCUk/fKdXRoC7EUxaNEIW7mxjEGX0/sUOB2A0sNioX
	/+IoV0yjdhSd/Jvc/lEu440Vdy5m19TOpMsGapEk1CT2b/m+6QzIgCYGR3IVzjarQ4hZu+04yQ5
	7FL6gNoJPoUmuZ/9UnETMWUblCAevR4VMWqgA5mbzWm0UlRAdCYeNHuetFvehzCmOkiafSBFfRO
	TsvSS744JHGH/pZtaUsxv+telczjQPv1tC6NbwcMjRsSuMv4SMaDGKoDaudrx3qlbs7/FVbwg60
	TABgIdOUi9vwRHkL+3vJLlgk83rxUiRSQjALWEz40bBJH0M8qHWNHcudExVjsd8lmF9kuHHKqyz
	1g2RlwpQm+M27O99bfKXgM+i/cv6zG9TOQc26nig40/E5Qk6KkiD6rUWUNntlucLrpMyK2bjLi8
	s6c3tx1bOVC13GQQmbb96sykiDm4TY5KinIcWJPogpuGfWSYOc1doRXpi0gl9xpT+Fcx53lVwKM
	G6yQAm7SWrH2Hu6kVZrRz5RouhLdvRXGrGVLrydpMg58VUZljUoWEbjQud5jVQ+ig==
X-Received: by 2002:a17:90b:2b43:b0:38d:ecfe:41ac with SMTP id 98e67ed59e1d1-38e29eb265fmr5809962a91.0.1784201615758;
        Thu, 16 Jul 2026 04:33:35 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c65:6c8f:5cab:df22:e20:58c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e545bb7sm9370362eec.3.2026.07.16.04.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:33:35 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linusw@kernel.org,
	nathan@kernel.org,
	chaitanya.kumar.borah@intel.com,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v12] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Thu, 16 Jul 2026 17:00:55 +0530
Message-ID: <20260716113055.41319-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C controllers may have child devices with GpioInt resources that
depend on GPIO controllers being fully initialized. If the I2C
controller probes and enumerates children before the referenced GPIO
controller has completed probe, GPIO interrupts may not be properly
configured, leading to device failures.

On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
fail with lost arbitration errors:

  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
  2.348157  lost arbitration

Add a dependency check that walks ACPI child devices and defers probe
until any referenced GPIO controller is bound.

Fixes: 3812a9e84265 ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11")
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Assisted-by: Claude:claude-sonnet-5
Assisted-by: DeepSeek:deepseek-v4-pro
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
---
v11 -> v12:
- Move gdev declaration to point of use with gpio_device_find_by_fwnode()
  call (Andy Shevchenko)
- Extract acpi_get_handle() return into acpi_status variable rather than
  inline in ACPI_FAILURE() (Andy Shevchenko)
- Use guard(device)(...) instead of scoped_guard(device, ...) {} for a
  single following statement (Andy Shevchenko)
- Use LIST_HEAD(res_list) instead of separate declaration + INIT_LIST_HEAD()
  (Andy Shevchenko)
- Check acpi_dev_get_resources() error before freeing the resource list,
  restoring the check-then-free ordering that had regressed in v11
  (Andy Shevchenko)
- Split ACPI_COMPANION(dev) assignment onto its own line rather than at
  declaration (Andy Shevchenko)

v10 -> v11:
- Replaced custom gpio_controller_ref list and dedup logic with
  gpio_device_find_by_fwnode() (Suggested-by: Andy Shevchenko)
- Moved resource-skip explanation from commit message into a code comment
- Fixed device_is_bound() to check gpio_device_to_device(gdev)->parent
  rather than the gpio_device's own internal class device, which is
  registered on the synthetic "gpio" bus and never has a driver bound to it

v9 -> v10:
- Use acpi_gpio_get_irq_resource() instead of open-coding GPIO resource
  type checks, eliminating duplication with gpiolib-acpi (Andy Shevchenko)
- Simplify string_source guard to a single string_length check, confirmed
  sufficient via ACPICA parser in drivers/acpi/acpica/rsutils.c
  (Andy Shevchenko)
- acpi_dev_get_resources() on single line, free only on success path
  (Andy Shevchenko)
- Reversed xmas tree ordering for variable declarations (Andy Shevchenko)
- Removed useless int ret = 0 assignment (Andy Shevchenko)
- acpi_dev_for_each_child() on single line (Andy Shevchenko)
- Use guard(device)(gpio_dev) pattern to avoid uninitialized variable
  warning and deduplicate the !gpio_dev check (Andy Shevchenko)

v8 -> v9:
- Sent as a 2-patch series: revert of the broken v8 patch, plus a
  corrected resubmission
- Use acpi_gpio_get_irq_resource() instead of open-coding GPIO resource
  type checks, eliminating duplication with gpiolib-acpi (Andy Shevchenko)
- Remove gpio_dep_ctx wrapper struct, pass list_head * directly (Andy Shevchenko)
- Add const to gpio_controller_ref.path (Andy Shevchenko)
- Add NULL check for resource_source.string_ptr to fix a crash on hardware
  where GPIO resources have no named controller (Reported-by: Nathan
  Chancellor, Reported-by: Chaitanya Kumar Borah)
- Use acpi_dev_get_resources() return value properly (Andy Shevchenko)
- Fix all error paths to call free_gpio_controller_list() (Andy Shevchenko)
- Change guard to #if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
- Remove erroneous put_device() calls -- acpi_get_first_physical_node()
  returns a borrowed pointer with no refcount increment
- Use LIST_HEAD() macro, split adev declaration and assignment (Andy Shevchenko)
- scoped_guard single statement without braces (Andy Shevchenko)
- Remove misused Reported-by/Closes tags (Andy Shevchenko)

v7 -> v8:
- Add revert of the earlier pinctrl-amd DMI quirk (patch 1 of the original
  v1-v7 series), confirmed unnecessary once probe ordering is fixed
  (Mario Limonciello)
- Collect Acked-by (Bartosz Golaszewski) and Reviewed-by (Mario Limonciello)

v6 -> v7:
- Fix unused 'ret' variable in check_child_gpioint() (kernel test robot)
- Replace BugLink: with Link: (Bartosz Golaszewski)
- Add Reported-by and Closes tags for kernel test robot warning

v5 -> v6:
- Replace DMI-specific deferral with a generic GpioInt dependency check
  walking ACPI child devices (Suggested-by: Mario Limonciello)

v4 -> v5:
- Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
- Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)

v3 -> v4:
- Rebase onto Linus Walleij's tree (the original patch 1 already there)
- Use --base so series is correctly 1/1 (Andy Shevchenko)

v2 -> v3:
- Fix variable declaration style (Andy Shevchenko)
- Add BugLink tag (Andy Shevchenko)
- CC AMD engineers (Andy Shevchenko)

v1 -> v2:
- Replace custom HID/UID lookup with acpi_dev_get_first_match_dev()
- Use device_is_bound() under device_lock() with explanatory comments
- Add Assisted-by tags per coding-assistants.rst

Note: this patch was originally part of a 2-patch series (v1-v7) whose
first patch was a DMI-specific pinctrl-amd IRQ quirk; that patch was
merged separately into Linus Walleij's tree at v1 and later reverted at
v8 once this patch made the manual IRQ restoration unnecessary.

 drivers/i2c/busses/i2c-designware-platdrv.c | 31 ++++++++++-----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 597aa9706364..a35a9cfb4432 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -141,11 +141,11 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
  */
 static int check_gpioint_resource(struct acpi_resource *ares, void *data)
 {
-	struct gpio_device *gdev __free(gpio_device_put) = NULL;
 	struct acpi_resource_gpio *agpio;
 	struct acpi_device *gpio_adev;
 	struct device *gpio_dev;
 	acpi_handle handle;
+	acpi_status status;
 
 	if (!acpi_gpio_get_irq_resource(ares, &agpio))
 		return 1; /* not a GpioInt resource, skip */
@@ -153,47 +153,46 @@ static int check_gpioint_resource(struct acpi_resource *ares, void *data)
 	if (!agpio->resource_source.string_length)
 		return 1; /* no named controller, skip */
 
-	if (ACPI_FAILURE(acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle)))
+	status = acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle);
+	if (ACPI_FAILURE(status))
 		return 1;
 
 	gpio_adev = acpi_fetch_acpi_dev(handle);
 	if (!gpio_adev)
 		return 1;
 
-	gdev = gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));
+	struct gpio_device *gdev __free(gpio_device_put) =
+		gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));
 	if (!gdev)
 		return -EPROBE_DEFER; /* controller not registered yet: abort walk */
 
 	gpio_dev = gpio_device_to_device(gdev)->parent;
-	scoped_guard(device, gpio_dev) {
-		if (!device_is_bound(gpio_dev))
-			return -EPROBE_DEFER; /* controller not bound yet: abort walk */
-	}
+	guard(device)(gpio_dev);
+	if (!device_is_bound(gpio_dev))
+		return -EPROBE_DEFER; /* controller not bound yet: abort walk */
 
 	return 1; /* bound, skip adding to resource list, continue walk */
 }
 
 static int check_child_gpioint(struct acpi_device *adev, void *data)
 {
-	struct list_head res_list;
+	LIST_HEAD(res_list);
 	int ret;
 
-	INIT_LIST_HEAD(&res_list);
 	ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);
+	if (ret < 0)
+		return ret;
+
 	acpi_dev_free_resource_list(&res_list);
 
-	/*
-	 * ret is a nonnegative resource count on success, which must not
-	 * be mistaken for a nonzero "stop iteration" signal by
-	 * acpi_dev_for_each_child(); only forward genuine errors.
-	 */
-	return ret < 0 ? ret : 0;
+	return 0;
 }
 
 static int i2c_dw_check_gpio_dependencies(struct device *dev)
 {
-	struct acpi_device *adev = ACPI_COMPANION(dev);
+	struct acpi_device *adev;
 
+	adev = ACPI_COMPANION(dev);
 	if (!adev)
 		return 0;
 

base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
prerequisite-patch-id: 2bedab9881d6b5b467c71fd4881d859e58269b9e
-- 
2.54.0

