From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 1/2] selftests: add gpio generated files to .gitignore
Date: Fri, 21 Apr 2017 18:13:00 -0600
Message-ID: <21d6eae26cfba6328c07b996d04fb62c42ec02c4.1492819732.git.shuahkh@osg.samsung.com>
References: <cover.1492819732.git.shuahkh@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1492819732.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1492819732.git.shuahkh@osg.samsung.com>
References: <cover.1492819732.git.shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

gpio test generates files in selftests directory. Add them to .gitignore.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/.gitignore | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/.gitignore b/tools/testing/selftests/.gitignore
index f0600d2..9175035 100644
--- a/tools/testing/selftests/.gitignore
+++ b/tools/testing/selftests/.gitignore
@@ -1 +1,5 @@
 kselftest
+gpiogpio-event-mon
+gpiogpio-hammer
+gpioinclude/
+gpiolsgpio
-- 
2.9.3
