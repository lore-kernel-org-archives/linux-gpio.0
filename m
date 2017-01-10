From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] tools: gpio add .gitignore for generated files
Date: Tue, 10 Jan 2017 07:07:51 -0700
Message-ID: <56151fe1-67f6-37f7-08c7-db61c664adb3@osg.samsung.com>
References: <20170105213236.15562-1-shuahkh@osg.samsung.com>
 <20170105213236.15562-5-shuahkh@osg.samsung.com>
 <CACRpkdbeT8PgxW+VCGwrznOTQV=2Dw8CcJUqZAcKdB2a96tJXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbeT8PgxW+VCGwrznOTQV=2Dw8CcJUqZAcKdB2a96tJXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>
List-Id: linux-gpio@vger.kernel.org

On 01/10/2017 02:29 AM, Linus Walleij wrote:
> On Thu, Jan 5, 2017 at 10:32 PM, Shuah Khan <shuahkh@osg.samsung.com> wrote:
> 
>> Add .gitignore for generated files.
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  tools/gpio/.gitignore | 4 ++++
>>  1 file changed, 4 insertions(+)
>>  create mode 100644 tools/gpio/.gitignore
>>
>> diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
>> new file mode 100644
>> index 0000000..767ad24
>> --- /dev/null
>> +++ b/tools/gpio/.gitignore
>> @@ -0,0 +1,4 @@
>> +gpio-event-mon
>> +gpio-hammer
>> +lsgpio
>> +include
> 
> I understand the first three.
> 
> But "include"?
> How did you produce that?
> 
> Yours,
> Linus Walleij
> 

I saw this after building selftests. gpio selftests Makefile installs
headres. "make kselftest" should reproduce the problem. This following
does an header install from tools/testing/selftests/gpio/Makefile

../../../../usr/include/linux/gpio.h:
        make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/

thanks,
-- Shuah
