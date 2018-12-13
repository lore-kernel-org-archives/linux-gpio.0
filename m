From: shuah <shuah@kernel.org>
Subject: Re: [PATCH] selftests: Fix test errors related to lib.mk khdr target
Date: Thu, 13 Dec 2018 15:50:01 -0700
Message-ID: <25593aa4-a2a7-6567-11f2-b702b6e5563c@kernel.org>
References: <20181213200011.10779-1-shuah@kernel.org>
 <623cdf7b-fc3c-2a93-c61a-a043e3d7f75b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <623cdf7b-fc3c-2a93-c61a-a043e3d7f75b@redhat.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, dvhart@infradead.org, bamv2005@gmail.com, brgl@bgdev.pl, fathi.boudra@linaro.org, anders.roxell@linaro.org, daniel.diaz@linaro.org, pintu.ping@gmail.com, drjones@redhat.com, hofsass@google.com, peterx@redhat.com, peng.hao2@zte.com.cn, wei@redhat.com, davem@davemloft.net, dcaratti@redhat.com, akpm@linux-foundation.org, mhocko@suse.com, khalid.aziz@oracle.com, mpe@ellerman.id.au, aneesh.kumar@linux.vnet.ibm.com, dima@arista.com
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org, shuah <shuah@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12/13/18 3:40 PM, Paolo Bonzini wrote:
> On 13/12/18 21:00, shuah@kernel.org wrote:
>> From: Shuah Khan <shuah@kernel.org>
>>
>> Commit b2d35fa5fc80 ("selftests: add headers_install to lib.mk") added
>> khdr target to run headers_install target from the main Makefile. The
>> logic uses KSFT_KHDR_INSTALL and top_srcdir as controls to initialize
>> variables and include files to run headers_install from the top level
>> Makefile. There are a few problems with this logic.
>>
>> 1. Exposes top_srcdir to all tests
>> 2. Common logic impacts all tests
>> 3. Uses KSFT_KHDR_INSTALL, top_srcdir, and khdr in an adhoc way. Tests
>>     add "khdr" dependency in their Makefiles to TEST_PROGS_EXTENDED in
>>     some cases, and STATIC_LIBS in other cases. This makes this framework
>>     confusing to use.
>>
>> The common logic that runs for all tests even when KSFT_KHDR_INSTALL
>> isn't defined by the test. top_srcdir is initialized to a default value
>> when test doesn't initialize it. It works for all tests without a sub-dir
>> structure and tests with sub-dir structure fail to build.
>>
>> e.g: make -C sparc64/drivers/ or make -C drivers/dma-buf
>>
>> ../../lib.mk:20: ../../../../scripts/subarch.include: No such file or directory
>> make: *** No rule to make target '../../../../scripts/subarch.include'.  Stop.
>>
>> There is no reason to require all tests to define top_srcdir and there is
>> no need to require tests to add khdr dependency using adhoc changes to
>> TEST_* and other variables.
>>
>> Fix it with a consistent use of KSFT_KHDR_INSTALL and top_srcdir from tests
>> that have the dependency on headers_install.
>>
>> Change common logic to include khdr target define and "all" target with
>> dependency on khdr when KSFT_KHDR_INSTALL is defined.
>>
>> Only tests that have dependency on headers_install have to define just
>> the KSFT_KHDR_INSTALL, and top_srcdir variables and there is no need to
>> specify khdr dependency in the test Makefiles.
> 
> Looks good.  Could you please provide a topic branch so that we can
> avoid conflicts between our trees at the next merge window.
> 

Thanks. The topic branch is

git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next

I will apply it in a day or two to get ready for the merge window.

thanks,
-- Shuah
